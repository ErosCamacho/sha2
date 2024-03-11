#include "sha2_sw.h"
#include "sha2_224.h"
#include "sha2_256.h"
#include "sha2_384.h"
#include "sha2_512.h"
#include "sha2_512_224.h"
#include "sha2_512_256.h"

#if SHA_224
void sha2_sw(sha2_ctx* context, unsigned char* data, size_t length, unsigned char* digest) {
        sha224Init(context);
        //Digest the message
        sha224Update(context, data, length);
        //Finalize the SHA-256 message digest
        sha224Final(context, digest);
}
#elif SHA_256
void sha2_sw(sha2_ctx* context, unsigned char* data, size_t length, unsigned char* digest) {
    sha256Init(context);
    //Digest the message
    sha256Update(context, data, length);
    //Finalize the SHA-256 message digest
    sha256Final(context, digest);
}
#elif SHA_384
void sha2_sw(sha2_ctx* context, unsigned char* data, size_t length, unsigned char* digest) {
    sha384Init(context);
    //Digest the message
    sha384Update(context, data, length);
    //Finalize the SHA-256 message digest
    sha384Final(context, digest);
}
#elif SHA_512
void sha2_sw(sha2_ctx* context, unsigned char* data, size_t length, unsigned char* digest) {
    sha512Init(context);
    //Digest the message
    sha512Update(context, data, length);
    //Finalize the SHA-256 message digest
    sha512Final(context, digest);
}
#elif SHA_512_224
void sha2_sw(sha2_ctx* context, unsigned char* data, size_t length, unsigned char* digest) {
    sha512_224Init(context);
    //Digest the message
    sha512_224Update(context, data, length);
    //Finalize the SHA-256 message digest
    sha512_224Final(context, digest);
}
#elif SHA_512_256
void sha2_sw(sha2_ctx* context, unsigned char* data, size_t length, unsigned char* digest) {
    sha512_256Init(context);
    //Digest the message
    sha512_256Update(context, data, length);
    //Finalize the SHA-256 message digest
    sha512_256Final(context, digest);
}
#else
void sha2_sw(sha2_ctx* context, unsigned char data, size_t length, unsigned char* digest) {
    sha256Init(context);
    //Digest the message
    sha256Update(context, data, length);
    //Finalize the SHA-256 message digest
    sha256Final(context, digest);
}
#endif