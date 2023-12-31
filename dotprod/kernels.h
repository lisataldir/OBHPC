//
#pragma once

//
#include "types.h"

//
f64 dotprod_base(f64 *restrict a, f64 *restrict b, u64 n);

f64 dotprod_dicho(f64 *restrict a, f64 *restrict b, u64 n);

f64 dotprod_ads(f64 a[], f64  b[], u64 n);

f64 dotprod_unroll4(f64 *restrict a, f64 *restrict b, u64 n);

f64 dotprod_unroll8(f64 *restrict a, f64 *restrict b, u64 n);

f64 dotprod_cblas(f64 a[], f64 b[], u64 n);

