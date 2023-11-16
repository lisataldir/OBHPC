//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 dotprod_base(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i] * b[i];

  return d;
}

//Optimisation boucle for
f64 dotprod_dicho(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;

  if ((n&1)==0)
  {
    for (u64 i = 0; i < (n>>1); i++)
      d += a[i] * b[i] + a[n-i-1] * b[n-i-1];
  } else 
  {
    for (u64 i = 0; i < (n>>1); i++)
      d += a[i] * b[i] + a[n-i-1] * b[n-i-1];
    d += a[n>>1]*b[n>>1];
  }

  return d;
}



//Passage par adresse
f64 dotprod_ads(f64 a[], f64 b[], u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += *(a+i) * *(b+i);

  return d;
}


//Unroll 4
f64 dotprod_unroll4(f64 *restrict a, f64 *restrict b, u64 n)
{

#define UNROLL4 4
  double d = 0.0;
  
  for (u64 i = 0; i < (n - (n & (UNROLL4 - 1))); i++)
    d += a[i] * b[i] + a[i+1] * b[i+1] + a[i+2]*b[i+2] + a[i+3]*b[i+3];

  for (u64 i = (n- (n&3)); i < n; i++)
    d += a[i] * b[i];

  return d;
}

//Unroll 8
f64 dotprod_unroll8(f64 *restrict a, f64 *restrict b, u64 n)
{

#define UNROLL8 8
  double d = 0.0;
  
  for (u64 i = 0; i < (n - (n & (UNROLL8 - 1))); i++)
    d += a[i] * b[i] + a[i+1] * b[i+1] + a[i+2]*b[i+2] + a[i+3]*b[i+3] + a[i+4]*b[i+4] + a[i+5]*b[i+5] + a[i+6]*b[i+6] + a[i+7]*b[i+7];

  for (u64 i = (n- (n&7)); i < n; i++)
    d += a[i] * b[i];

  return d;
}


//Cblas
f64 dotprod_cblas(f64 a[], f64 b[], u64 n)
{
  return cblas_ddot(n, a, 1, b, 1);
}


