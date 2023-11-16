//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

//
#include "types.h"

//Baseline - naive implementation
f64 reduc_base(f64 *restrict a, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i];

  return d;
}

//Optimisation boucle for
f64 reduc_dicho(f64 *restrict a, u64 n)
{
  double d = 0.0;

  if ((n&1)==0)
  {
    for (u64 i = 0; i < (n>>1); i++)
      d += a[i] + a[n-i-1];
  } else 
  {
    for (u64 i = 0; i < (n>>1); i++)
      d += a[i] + a[n-i-1];
    d += a[n>>1];
  }

  return d;
}


//Unroll 4
f64 reduc_unroll4(f64 *restrict a, u64 n)
{

#define UNROLL4 4
  double d = 0.0;
  
  for (u64 i = 0; i < (n - (n & (UNROLL4 - 1))); i++)
    d += a[i]+ a[i+1] + a[i+2] + a[i+3];

  for (u64 i = (n- (n&3)); i < n; i++)
    d += a[i];

  return d;
}

//Unroll 8
f64 reduc_unroll8(f64 *restrict a, u64 n)
{

#define UNROLL8 8
  double d = 0.0;
  
  for (u64 i = 0; i < (n - (n & (UNROLL8 - 1))); i++)
    d += a[i] + a[i+1] + a[i+2] + a[i+3] + a[i+4] + a[i+5] + a[i+6] + a[i+7];

  for (u64 i = (n- (n&7)); i < n; i++)
    d += a[i];

  return d;
}

f64 reduc_cblas(f64 *restrict a, u64 n){
  return cblas_dasum(n, a, 1);
}

