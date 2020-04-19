package FPGA

import Chisel._
import chisel3.util.HasBlackBoxInline
import chisel3.experimental.dontTouch

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.tilelink._
import freechips.rocketchip.subsystem._

import deepreuse.lsh._
import deepreuse.common._
import deepreuse.wrapper._
import deepreuse.memory._

import fpgashells.devices.xilinx.xilinxkc705mig._


class LSHWrapper(implicit p:Parameters) extends BaseWrapper
{
  val lsh = if(p(Advanced)) {LazyModule(new LSHAdvanced)} else {LazyModule(new LSHBasic)}

  val cacheRowBytes = p(ClusterCacheKey).rowBits/8
  //require(p(ClusterCacheKey).rowBits == p(IDCacheKey).rowBits)

  val BroadcastParams(nTrackers, bufferless) = p(BroadcastKey)
  val lineBytes = p(MemoryBusKey).beatBytes
  val cacheBlockBytes = p(MemoryBusKey).blockBytes
  val bh = LazyModule(new TLBroadcast(lineBytes, nTrackers, bufferless))  
  val ww = LazyModule(new TLWidthWidget(cacheRowBytes))

  var xilinxkc705mig: XilinxKC705MIG = null
  if(p(SimEnabled)){
    val memoryModel = LazyModule(new TLRAM(address = p(MemoryModelKey), beatBytes = lineBytes))
    if(p(Advanced)) memoryModel.node := TLFragmenter(lineBytes, cacheBlockBytes, holdFirstDeny=true) := bh.node := ww.node := lsh.common_node.node else memoryModel.node := lsh.masterNode
  }else{
    xilinxkc705mig = LazyModule(new XilinxKC705MIG(p(MemoryXilinxDDRKey)))
    if(p(Advanced)) xilinxkc705mig.node := TLFragmenter(lineBytes, cacheBlockBytes, holdFirstDeny=true) := bh.node := ww.node := lsh.common_node.node else xilinxkc705mig.node := lsh.masterNode
  }

  override lazy val module = new LSHWrapperModule(this)
}


class LSHWrapperModule(outer: LSHWrapper) extends BaseWrapperModule(outer)
{

  /****** CONNECT XILINXMIGIO ******/
  val ranges = AddressRange.fromSets(p(MemoryXilinxDDRKey).address)
  require (ranges.size == 1, "DDR range must be contiguous")
  val depth = ranges.head.size
  var xilinxkc705mig: XilinxKC705MIGIO = null
  if(!p(SimEnabled)){
    xilinxkc705mig = IO(new XilinxKC705MIGIO(depth))
    xilinxkc705mig <> outer.xilinxkc705mig.module.io.port
    xilinxkc705mig.suggestName("xilinxkc705migIO")
  }
  /****** CONNECT XILINXMIGIO ******/

  val lshModule = outer.lsh.module
  val lshRom = Module(new LSHROM)

  lshIO.get.resetDone := lshModule.io.resetDone

  // address counter
  val nLayerEntry=layerNumOfInputs*layerBatchSize*layerNumOfSubVectors
  val addrCnt = Reg(init = UInt(0, log2Up(nLayerEntry) + 1))

  val readEn = lshModule.io.inputIDandData.ready && lshModule.io.resetDone && (addrCnt =/= nLayerEntry.U)
  val cycle = Reg(init = UInt(0,32))
  cycle := cycle + 1.U
  when(readEn){
    addrCnt := addrCnt + 1.U
//   if(DEBUG_PRINTF_LOG){
    	printf("Address incremented - curAddr: 0x%x cycle: %d\n", addrCnt, cycle)
//	}
  }

  lshRom.io.clock := clock
  lshRom.io.me := readEn
  lshRom.io.address := addrCnt
  lshModule.io.inputIDandData.valid := readEn
  lshModule.io.inputIDandData.bits.inputID := addrCnt
  for(i<-0 until maxVectorDim){
    if (i < layerVectorDim)
      lshModule.io.inputIDandData.bits.inputData(i) := lshRom.io.q((i+1)*dataSize-1, i*dataSize)
    else
      lshModule.io.inputIDandData.bits.inputData(i) := UInt(0)
  }
  lshModule.io.hash_table.valid     := lshIO.get.hash_table.valid
  lshModule.io.hash_table.bits      := lshIO.get.hash_table.bits

  // counters
  val readIDCnt = Reg(init = UInt(0, log2Up(nLayerEntry) + 1))
  val readIDVal = (readIDCnt =/= nLayerEntry.U) && (lshModule.io.idCacheReady || lshModule.io.readID.ready) && (addrCnt === nLayerEntry.U)

  when(addrCnt === nLayerEntry.U){
    lshModule.io.verify := true.B
  }.otherwise{
    lshModule.io.verify := false.B
  }

  when(readIDVal){
  	readIDCnt := readIDCnt + UInt(1)
    if(DEBUG_PRINTF_LOG){
    	printf("ID address incremented - curIDAddr: 0x%x cycle: %d\n", readIDCnt, cycle)
    }
  }
  val totalHashNum = math.pow(2, layerHashSize).toInt
  val readValArrCnt = Reg(init = UInt(0, layerHashSize + 1))
  val readValArrVal = (readValArrCnt =/= totalHashNum.U) && (lshModule.io.clusterCacheReady || lshModule.io.readValArr.ready) && (addrCnt === nLayerEntry.U)

  when(readValArrVal){
  	readValArrCnt := readValArrCnt + UInt(1)
    if(DEBUG_PRINTF_LOG){
    	printf("Valid array address incremented - curValArrAddr: 0x%x cycle: %d\n", readValArrCnt, cycle)
    }
  }

  val readCentVal = lshModule.io.validArrayOut.valid && lshModule.io.validArrayOut.bits && (lshModule.io.clusterCacheReady || lshModule.io.readCentroid.ready) && (addrCnt === nLayerEntry.U)
  val readCentCnt = RegEnable(next=readValArrCnt, enable=readValArrVal)

  when(readCentVal){
  	readCentCnt := readCentCnt + UInt(1)
    if(DEBUG_PRINTF_LOG){
    	printf("Centroid address incremented - curCentAddr: 0x%x cycle: %d\n", readCentCnt, cycle)
    }
  }

  lshModule.io.readID.valid         := readIDVal 		//lshIO.get.readID.valid
  lshModule.io.readID.bits          := readIDCnt 		//lshIO.get.readID.bits
  lshModule.io.readCentroid.valid   := readCentVal 		//lshIO.get.readCentroid.valid
  lshModule.io.readCentroid.bits    := readCentCnt  	//lshIO.get.readCentroid.bits
  lshModule.io.readValArr.valid     := readValArrVal	//lshIO.get.readValArr.valid
  lshModule.io.readValArr.bits      := readValArrCnt	//lshIO.get.readValArr.bits

  when(lshModule.io.idOut.valid && (addrCnt === nLayerEntry.U)){
    if(DEBUG_PRINTF_LOG){
    	printf("IDCache response valid - data: 0x%x\n", lshModule.io.idOut.bits)
    }
  }

  when(lshModule.io.centroidsOut.valid && (addrCnt === nLayerEntry.U)){
    if(DEBUG_PRINTF_LOG){
    	printf("ClusterCache response valid - cluster: 0x%x count: 0x%x\n", lshModule.io.centroidsOut.bits.cluster.asUInt, lshModule.io.centroidsOut.bits.count)
    }
  }

  lshModule.io.clearMem.valid       := lshIO.get.clearMem.valid
  lshModule.io.clearMem.bits        := lshIO.get.clearMem.bits
  lshModule.io.hashConfReg          := lshIO.get.hashConfReg
  lshModule.io.dimConfReg           := lshIO.get.dimConfReg

  dontTouch(lshModule.io.inputIDandData.bits.inputData)

  lshIO.get.success := (addrCnt === nLayerEntry.U) && (readValArrCnt === totalHashNum.U) && (readIDCnt === nLayerEntry.U)

  if(DEBUG_PRINTF_LSH){
    printf("\n---LSHWrapper---\n")
    printf("resetDone: %d success: %d readEn: %d addrCnt: 0x%x ready: %d\n",
            lshIO.get.resetDone, lshIO.get.success, readEn, addrCnt, lshModule.io.inputIDandData.ready)
  }
}

class LSHROM(implicit p: Parameters) extends ParameterizedBlackBox()(p) with HasBlackBoxInline{

  val layer_num = p(AcceleratorKey).layer.layerNum
  val layer_input_dim = p(AcceleratorKey).layer.layerVectorDim

  val io = IO(new Bundle {
    val clock                = Input(Clock())
    val address              = Input(UInt(log2Up(maxNumOfInputs).W))
    val me                   = Input(UInt(1.W))
    val q                    = Output(UInt((dataSize*layer_input_dim).W))   
  })

  io.suggestName("LSHROMIO") 

  val benchmark = 
    maxNumOfInputs match {
      case 451584 => "mobilenet"
      case 28901376 => "vggnet"
      case 9622800 => "alexnet"
      case 4096000 => "cifarnet"
    }

  val data_type = 
    dataSize match {
      case 8 => if(fpuEnabled) "fp8" else "int8"
      case 32 => if(fpuEnabled) "fp32" else "int32"
    }    

  val base_dir = System.getProperty("user.dir")

  setInline("deepreuse/src/main/resources/vsrc/LSHROM.v",
    s"""
module LSHROM(
  input clock,
  input me,
  input ["""++ log2Down(maxNumOfInputs).toString ++""":0] address,
  output ["""++ (dataSize*layer_input_dim-1).toString ++""":0] q
);
  reg ["""++ (dataSize*layer_input_dim-1).toString ++""":0] out;
  reg ["""++ (dataSize*layer_input_dim-1).toString ++""":0] rom [0: """++ (maxNumOfInputs-1).toString ++"""];
  initial begin: init_and_load
    integer i;
    // 256 is the maximum length of $readmemh filename supported by Verilator
    reg [255*8-1:0] path;
    path = """"++ base_dir ++"""/../deepreuse-software/bin/"""++ benchmark ++"""/"""++ data_type ++"""/LSH_layer_"""++ layer_num.toString ++""".bin";
    $readmemb(path, rom);
  end : init_and_load
  always @(posedge clock) begin
    if (me) begin
      out <= rom[address];
    end
  end
  assign q = out;
endmodule
    """.stripMargin)

}
