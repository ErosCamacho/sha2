
CC=/usr/bin/cc
LDFLAGS=-lcrypto -lpynq -lcma -lpthread -lm

SOURCES_SW = sha2_sw/crypto.c sha2_sw/sha2_224.c sha2_sw/sha2_256.c sha2_sw/sha2_384.c sha2_sw/sha2_512.c sha2_sw/sha2_512_224.c sha2_sw/sha2_512_256.c
HEADERS_SW = sha2_sw/crypto.h sha2_sw/sha2_224.h sha2_sw/sha2_256.h sha2_sw/sha2_384.h sha2_sw/sha2_512.h sha2_sw/sha2_512_224.h sha2_sw/sha2_512_256.h

SOURCES_TEST = sha2_sw.c sha2_hw.c Funcion_Test.c Funciones_HW.c sha2_test.c
HEADERS_TEST = sha2_sw.h sha2_hw.h Funcion_Test.h Funciones_HW.h 

SOURCES_SPIRS = sha2_sw.c sha2_hw.c Funcion_Test.c Funciones_HW.c sha2_spirs.c
HEADERS_SPIRS = sha2_sw.h sha2_hw.h Funcion_Test.h Funciones_HW.h 

#SOURCES_SPIRS = sha3.c sha3_hw.c Funcion_Test.c Funciones_HW.c sha3_spirs.c
#HEADERS_SPIRS = sha3.h sha3_hw.h Funcion_Test.h Funciones_HW.h 

#SOURCES_TEST = sha256.c sha2_hw.c Funcion_Test.c Funciones_HW.c sha256_test.c
#HEADERS_TEST = sha256.h sha2_hw.h Funcion_Test.h Funciones_HW.h

#SOURCES_SPIRS = sha256.c sha2_hw.c Funcion_Test.c Funciones_HW.c sha256_spirs.c
#HEADERS_SPIRS = sha256.h sha2_hw.h Funcion_Test.h Funciones_HW.h

#all: sha3_512_spirs sha3_384_spirs sha3_256_spirs sha3_224_spirs sha3_512_test sha3_384_test sha3_256_test sha3_224_test

all: sha2_224_test sha2_256_test sha2_384_test sha2_512_test sha2_512_224_test sha2_512_256_test sha2_224_spirs sha2_256_spirs sha2_384_spirs sha2_512_spirs sha2_512_224_spirs sha2_512_256_spirs

#sha3_512_test: $(HEADERS_TEST) $(SOURCES_TEST)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -DSHA3_512 -o $@ $(SOURCES_TEST) $(LDFLAGS)

#sha3_384_test: $(HEADERS_TEST) $(SOURCES_TEST)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -DSHA3_384 -o $@ $(SOURCES_TEST) $(LDFLAGS)

sha2_224_test: $(HEADERS_SW) $(HEADERS_TEST) $(SOURCES_SW) $(SOURCES_TEST)
	$(CC) -DSHA_224 -o $@ $(SOURCES_SW) $(SOURCES_TEST) $(LDFLAGS)

sha2_256_test: $(HEADERS_SW) $(HEADERS_TEST) $(SOURCES_SW) $(SOURCES_TEST)
	$(CC) -DSHA_256 -o $@ $(SOURCES_SW) $(SOURCES_TEST) $(LDFLAGS)

sha2_384_test: $(HEADERS_SW) $(HEADERS_TEST) $(SOURCES_SW) $(SOURCES_TEST)
	$(CC) -DSHA_384 -o $@ $(SOURCES_SW) $(SOURCES_TEST) $(LDFLAGS)

sha2_512_test: $(HEADERS_SW) $(HEADERS_TEST) $(SOURCES_SW) $(SOURCES_TEST)
	$(CC) -DSHA_512 -o $@ $(SOURCES_SW) $(SOURCES_TEST) $(LDFLAGS)

sha2_512_224_test: $(HEADERS_SW) $(HEADERS_TEST) $(SOURCES_SW) $(SOURCES_TEST)
	$(CC) -DSHA_512_224 -o $@ $(SOURCES_SW) $(SOURCES_TEST) $(LDFLAGS)

sha2_512_256_test: $(HEADERS_SW) $(HEADERS_TEST) $(SOURCES_SW) $(SOURCES_TEST)
	$(CC) -DSHA_512_256 -o $@ $(SOURCES_SW) $(SOURCES_TEST) $(LDFLAGS)

sha2_224_spirs: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_SPIRS)
	$(CC) -DSHA_224 -o $@ $(SOURCES_SW) $(SOURCES_SPIRS) $(LDFLAGS)

sha2_256_spirs: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_SPIRS)
	$(CC) -DSHA_256 -o $@ $(SOURCES_SW) $(SOURCES_SPIRS) $(LDFLAGS)

sha2_384_spirs: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_SPIRS)
	$(CC) -DSHA_384 -o $@ $(SOURCES_SW) $(SOURCES_SPIRS) $(LDFLAGS)

sha2_512_spirs: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_SPIRS)
	$(CC) -DSHA_512 -o $@ $(SOURCES_SW) $(SOURCES_SPIRS) $(LDFLAGS)

sha2_512_224_spirs: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_SPIRS)
	$(CC) -DSHA_512_224 -o $@ $(SOURCES_SW) $(SOURCES_SPIRS) $(LDFLAGS)

sha2_512_256_spirs: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_SPIRS)
	$(CC) -DSHA_512_256 -o $@ $(SOURCES_SW) $(SOURCES_SPIRS) $(LDFLAGS)

#sha3_224_test: $(HEADERS_TEST) $(SOURCES_TEST)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -DSHA3_224 -o $@ $(SOURCES_TEST) $(LDFLAGS)

#sha3_512_spirs: $(HEADERS_SPIRS) $(SOURCES_SPIRS)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -DSHA3_512 -o $@ $(SOURCES_SPIRS) $(LDFLAGS)

#sha3_384_spirs: $(HEADERS_SPIRS) $(SOURCES_SPIRS)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -DSHA3_384 -o $@ $(SOURCES_SPIRS) $(LDFLAGS)

#sha3_256_spirs: $(HEADERS_SPIRS) $(SOURCES_SPIRS)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -DSHA3_256 -o $@ $(SOURCES_SPIRS) $(LDFLAGS)

#sha3_224_spirs: $(HEADERS_SPIRS) $(SOURCES_SPIRS)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -DSHA3_224 -o $@ $(SOURCES_SPIRS) $(LDFLAGS)

#sha3_spirs: $(HEADERS_SPIRS) $(SOURCES_SPIRS)
#	$(CC) -DCRYPTO_NAMESPACE\(s\)=SHA3_\#\#s -o $@ $(SOURCES_SPIRS) $(LDFLAGS)

#.PHONY: all sha3_512_test sha3_384_test sha3_256_test sha3_224_test sha3_512_spirs sha3_384_spirs sha3_256_spirs sha3_224_spirs clean
.PHONY: all clean

clean:
	-rm sha2_224_test sha2_256_test sha2_384_test sha2_512_test sha2_512_224_test sha2_512_256_test sha2_224_spirs sha2_256_spirs sha2_384_spirs sha2_512_spirs sha2_512_224_spirs sha2_512_256_spirs