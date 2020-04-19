package deepreuse.memory

import Chisel._

import freechips.rocketchip.config.Parameters
import freechips.rocketchip.util._
import freechips.rocketchip.tilelink._

import deepreuse.lsh._

/* Top module IO */
class ClusterCacheBundle(outer: ClusterCache)(implicit val p: Parameters) extends Bundle with HasLSHParameters
{
  val req   = Decoupled(new ClusterCacheReq).flip
  val resp  = Decoupled(new ClusterCacheResp) 
  val verify = Flipped(Bool())

  override def cloneType = new ClusterCacheBundle(outer).asInstanceOf[this.type]
}

class ClusterCacheReq(implicit p: Parameters) extends CacheReqBare()(p) {
  val data = UInt((countSize + maxVectorDim*dataSize).W)
}

class ClusterCacheResp(implicit val p: Parameters) extends Bundle with HasLSHParameters {
  val cluster = Vec(maxVectorDim, UInt(dataSize.W))
  val count = UInt(countSize.W)
}

class IDCacheBundle(outer: IDCache)(implicit val p: Parameters) extends Bundle with HasLSHParameters
{
  val req   = Decoupled(new IDCacheReq).flip
  val resp  = Decoupled(new IDCacheResp) 
  val verify = Flipped(Bool())

  override def cloneType = new IDCacheBundle(outer).asInstanceOf[this.type]
}

class IDCacheReq(implicit p: Parameters) extends CacheReqBare()(p) {
  val data = UInt(maxHashSize.W)
}

class IDCacheResp(implicit val p: Parameters) extends Bundle with HasLSHParameters {
  val hashID = UInt(maxHashSize.W)
}

class CacheReqBare(implicit val p: Parameters) extends Bundle with HasLSHParameters {
  val entryValid = Bool()
  val addr = UInt(32.W)
  val cmd  = Bits(width = M_SZ)
}
/* Top module IO */

/* Data array IO*/
class CCDataReadReq(implicit val p: Parameters) extends ParameterizedBundle()(p) with ClusterCacheParameters{
  val way_en = Bits(width = nWays)
  val addr   = Bits(width = untagBits)
}

class CCDataWriteReq(implicit p: Parameters) extends CCDataReadReq()(p) with ClusterCacheParameters{
  val wmask  = Bits(width = rowWords)
  val data   = Bits(width = rowBits)
}

class ICDataReadReq(implicit val p: Parameters) extends ParameterizedBundle()(p) with IDCacheParameters{
  val way_en = Bits(width = nWays)
  val addr   = Bits(width = untagBits)
}

class ICDataWriteReq(implicit p: Parameters) extends ICDataReadReq()(p) with IDCacheParameters{
  val wmask  = Bits(width = rowWords)
  val data   = Bits(width = rowBits)
}
/* Data array IO*/

/* Cluster Cache MSHR IO */
class CCMSHRReq(implicit p: Parameters) extends CCReplay with CCHasMissInfo

class CCReplay(implicit p: Parameters) extends ClusterCacheReq

trait CCHasMissInfo extends ClusterCacheParameters {
  val tag_match = Bool()
  val old_meta = new CCMetadata
  val way_en = Bits(width = nWays)
}

class CCRefillReq(implicit p: Parameters) extends CCDataReadReq()(p) //way_en, addr

class CCMSHRReqInternal(implicit p: Parameters) extends CCReplayInternal with CCHasMissInfo

class CCReplayInternal(implicit p: Parameters) extends CacheReqBare with ClusterCacheParameters {
  val sdq_id = UInt(width = log2Up(nSDQ))
}
/* Cluster Cache MSHR IO */

/* ID Cache MSHR IO */
class ICMSHRReq(implicit p: Parameters) extends ICReplay with ICHasMissInfo

class ICReplay(implicit p: Parameters) extends IDCacheReq

trait ICHasMissInfo extends IDCacheParameters {
  val tag_match = Bool()
  val old_meta = new ICMetadata
  val way_en = Bits(width = nWays)
}

class ICRefillReq(implicit p: Parameters) extends ICDataReadReq()(p) //way_en, addr

class ICMSHRReqInternal(implicit p: Parameters) extends ICReplayInternal with ICHasMissInfo

class ICReplayInternal(implicit p: Parameters) extends CacheReqBare with IDCacheParameters {
  val sdq_id = UInt(width = log2Up(nSDQ))
}
/* ID Cache MSHR IO */

/* Cluster Cache MetaData */
class CCMetadata(implicit val p: Parameters) extends ParameterizedBundle()(p) with ClusterCacheParameters {
  val coh = new ClientMetadata
  val tag = UInt(width = tagBits)
}

object CCMetadata {
  def apply(tag: Bits, coh: ClientMetadata)(implicit p: Parameters) = {
    val meta = Wire(new CCMetadata)
    meta.tag := tag
    meta.coh := coh
    meta
  }
}
/* Cluster Cache MetaData */

/* ID Cache MetaData */
class ICMetadata(implicit val p: Parameters) extends ParameterizedBundle()(p) with IDCacheParameters {
  val coh = new ClientMetadata
  val tag = UInt(width = tagBits)
}

object ICMetadata {
  def apply(tag: Bits, coh: ClientMetadata)(implicit p: Parameters) = {
    val meta = Wire(new ICMetadata)
    meta.tag := tag
    meta.coh := coh
    meta
  }
}
/* ID Cache MetaData */

/* Cluster Cache Meta R/W */
class CCMetaReadReq(implicit val p: Parameters) extends ParameterizedBundle()(p) with ClusterCacheParameters {
  val idx    = UInt(width = idxBits)
  val way_en = UInt(width = nWays)
  val tag    = UInt(width = tagBits)
}

class CCMetaWriteReq(implicit p: Parameters) extends CCMetaReadReq()(p) {
  val data = new CCMetadata
}
/* Cluster Cache Meta R/W */

/* ID Cache Meta R/W */
class ICMetaReadReq(implicit val p: Parameters) extends ParameterizedBundle()(p) with IDCacheParameters {
  val idx    = UInt(width = idxBits)
  val way_en = UInt(width = nWays)
  val tag    = UInt(width = tagBits)
}

class ICMetaWriteReq(implicit p: Parameters) extends ICMetaReadReq()(p) {
  val data = new ICMetadata
}
/* ID Cache Meta R/W */


/* Cluster Cache Writeback Request */
class CCWritebackReq(params: TLBundleParameters)(implicit val p: Parameters) extends ParameterizedBundle()(p) with ClusterCacheParameters{
  val tag = Bits(width = tagBits)
  val idx = Bits(width = idxBits)
  val source = UInt(width = params.sourceBits)
  val way_en = Bits(width = nWays)
  val param = UInt(width = TLPermissions.cWidth) 
  val voluntary = Bool()

  override def cloneType = new CCWritebackReq(params).asInstanceOf[this.type]
}
/* Cluster Cache Writeback Request */

/* ID Cache Writeback Request */
class ICWritebackReq(params: TLBundleParameters)(implicit val p: Parameters) extends ParameterizedBundle()(p) with IDCacheParameters{
  val tag = Bits(width = tagBits)
  val idx = Bits(width = idxBits)
  val source = UInt(width = params.sourceBits)
  val way_en = Bits(width = nWays)
  val param = UInt(width = TLPermissions.cWidth) 
  val voluntary = Bool()

  override def cloneType = new ICWritebackReq(params).asInstanceOf[this.type]
}
/* ID Cache Writeback Request */


