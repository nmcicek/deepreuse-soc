extern "C" void SimFPUMulAdd
(
  int   s_axis_a_tdata,
  unsigned char  s_axis_a_tvalid,
  int   s_axis_b_tdata,
  unsigned char  s_axis_b_tvalid,
  int   s_axis_c_tdata,
  unsigned char  s_axis_c_tvalid,
  unsigned char* m_axis_result_tvalid,
  int*  m_axis_result_tdata
)
{
  // convert unsigned format to binary
  char a_data[32];  strcpy(a_data, "");
  uintToBinary(s_axis_a_tdata, 32, a_data);

  // convert unsigned format to binary
  char b_data[32];  strcpy(b_data, "");
  uintToBinary(s_axis_b_tdata, 32, b_data);

  // convert unsigned format to binary
  char c_data[32];  strcpy(c_data, "");
  uintToBinary(s_axis_c_tdata, 32, c_data);

  // convert binary to float
  float a_float = IEEEToFloat(a_data);
  float b_float = IEEEToFloat(b_data);
  float c_float = IEEEToFloat(c_data);

  // add
  float r_float = a_float * b_float + c_float;

  // back to IEEE format
  floatToIEEE r_var;
  r_var.f = r_float;

  // concat sign exp mant fields
  char m_data[32];  strcpy(m_data, "");
  uintToBinary(r_var.field.sign,1,m_data);
  uintToBinary(r_var.field.exponent, 8,m_data);
  uintToBinary(r_var.field.mantissa, 23,m_data); 

  // construct output
  *m_axis_result_tdata = binaryToUint(m_data);
  *m_axis_result_tvalid = s_axis_b_tvalid && s_axis_a_tvalid;
}
