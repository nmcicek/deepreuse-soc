extern "C" void SimIntToFloat
(
  int   s_axis_a_tdata,
  unsigned char  s_axis_a_tvalid,
  int*  m_axis_result_tdata,
  unsigned char* m_axis_result_tvalid
)
{
  // convert to float
  float r_float = s_axis_a_tdata;

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
  *m_axis_result_tvalid = s_axis_a_tvalid;
}
