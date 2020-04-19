#include <stdio.h>
#include <stdlib.h>
#include <string.h> 
#include <limits.h>

#if UINT_MAX >= 0xFFFFFFFF
typedef unsigned uint32;
#else
typedef unsigned long uint32;
#endif

// Convert IEEE format in string (binary) to float
double IEEEToFloat(const char s[32])
{
  double f;
  int sign, exp;
  uint32 mant;
  int i;

  // Do you really need strto*() here?
  sign = s[0] - '0';

  // Do you really need strto*() or pow() here?
  exp = 0;
  for (i = 1; i <= 8; i++)
    exp = exp * 2 + (s[i] - '0');

  // Remove the exponent bias
  exp -= 127;

  // Should really check for +/-Infinity and NaNs here

  if (exp > -127)
  {
    // Normal(ized) numbers
    mant = 1; // The implicit "1."
    // Account for "1." being in bit position 23 instead of bit position 0
    exp -= 23;
  }
  else
  {
    // Subnormal numbers
    mant = 0; // No implicit "1."
    exp = -126; // See your IEEE-54 formulas
    // Account for ".1" being in bit position 22 instead of bit position -1
    exp -= 23;
  }

  // Or do you really need strto*() or pow() here?
  for (i = 9; i <= 31; i++)
    mant = mant * 2 + (s[i] - '0');

  f = mant;

  // Do you really need pow() here?
  while (exp > 0)
    f *= 2, exp--;

  // Or here?
  while (exp < 0)
    f /= 2, exp++;

  if (sign)
    f = -f;

  return f;
}

// convert binary format in string to unsigned integer
unsigned int binaryToUint(const char binary[32])
{
    unsigned int value;
    char *endp = NULL;
    value = strtoul(binary, &endp, 2);
    return value;
}

// convert unsigned integer to binary format in string
void uintToBinary(unsigned int n, int i, char *str)
{
    unsigned int k;
    for (i--; i >= 0; i--)
   {
      k = n >> i;
      if (k & 1)
        strcat(str, "1");
      else
        strcat(str, "0");
    }
}
