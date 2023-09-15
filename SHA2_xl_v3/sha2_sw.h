#include "params.h"
#include "sha2_sw/sha2_224.h"
#include "sha2_sw/sha2_256.h"
#include "sha2_sw/sha2_384.h"
#include "sha2_sw/sha2_512.h"
#include "sha2_sw/sha2_512_224.h"
#include "sha2_sw/sha2_512_256.h"

#ifdef SHA_224

typedef Sha224Context sha2_ctx;

#elif SHA_256

typedef Sha256Context sha2_ctx;

#elif SHA_384

typedef Sha384Context sha2_ctx;

#elif SHA_512

typedef Sha512Context sha2_ctx;

#elif SHA_512_224

typedef Sha512_224Context sha2_ctx;

#elif SHA_512_256

typedef Sha512_256Context sha2_ctx;

#else

typedef Sha256Context sha2_ctx;

#endif

void sha2_sw(sha2_ctx* context, unsigned char* data, size_t length, unsigned char* digest);