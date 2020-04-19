// Convert IEEE format in string (binary) to float
extern double IEEEToFloat(const char s[32]);

// convert float to IEEE
typedef union
{
      float f;
      struct
      {
            unsigned int mantissa : 23;
            unsigned int exponent : 8;
            unsigned int sign : 1;
       } field;
} floatToIEEE;

// convert binary format in string to unsigned integer
extern unsigned int binaryToUint(const char binary[32]);

// convert unsigned integer to binary format in string
extern void uintToBinary(unsigned int n, int i, char *str);