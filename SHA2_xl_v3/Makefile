
CC=/usr/bin/cc
LDFLAGS=-lcrypto -lpynq -lcma -lpthread -lm

SOURCES_SW =	sha2/sw/crypto.c sha2/sw/sha2_224.c sha2/sw/sha2_256.c sha2/sw/sha2_384.c \
				sha2/sw/sha2_512.c sha2/sw/sha2_512_224.c sha2/sw/sha2_512_256.c
HEADERS_SW =	sha2/sw/crypto.h sha2/sw/sha2_224.h sha2/sw/sha2_256.h sha2/sw/sha2_384.h \
				sha2/sw/sha2_512.h sha2/sw/sha2_512_224.h sha2/sw/sha2_512_256.h

SOURCES_TEST = sha2/sw/sha2_sw.c sha2/hw/sha2_hw.c sha2/common/Funcion_Test.c sha2/common/Funciones_HW.c sha2_test.c
HEADERS_TEST = sha2/sw/sha2_sw.h sha2/hw/sha2_hw.h sha2/common/Funcion_Test.h sha2/common/Funciones_HW.h 

SOURCES_DEMO = sha2/sw/sha2_sw.c sha2/hw/sha2_hw.c sha2/common/Funcion_Test.c sha2/common/Funciones_HW.c sha2_demo.c
HEADERS_DEMO = sha2/sw/sha2_sw.h sha2/hw/sha2_hw.h sha2/common/Funcion_Test.h sha2/common/Funciones_HW.h 

all: sha2_224_test sha2_256_test sha2_384_test sha2_512_test sha2_512_224_test sha2_512_256_test sha2_224_demo sha2_256_demo sha2_384_demo sha2_512_demo sha2_512_224_demo sha2_512_256_demo

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

sha2_224_demo: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_DEMO)
	$(CC) -DSHA_224 -o $@ $(SOURCES_SW) $(SOURCES_DEMO) $(LDFLAGS)

sha2_256_demo: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_DEMO)
	$(CC) -DSHA_256 -o $@ $(SOURCES_SW) $(SOURCES_DEMO) $(LDFLAGS)

sha2_384_demo: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_DEMO)
	$(CC) -DSHA_384 -o $@ $(SOURCES_SW) $(SOURCES_DEMO) $(LDFLAGS)

sha2_512_demo: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_DEMO)
	$(CC) -DSHA_512 -o $@ $(SOURCES_SW) $(SOURCES_DEMO) $(LDFLAGS)

sha2_512_224_demo: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_DEMO)
	$(CC) -DSHA_512_224 -o $@ $(SOURCES_SW) $(SOURCES_DEMO) $(LDFLAGS)

sha2_512_256_demo: $(HEADERS_SW) $(HEADERS_SPIRS) $(SOURCES_SW) $(SOURCES_DEMO)
	$(CC) -DSHA_512_256 -o $@ $(SOURCES_SW) $(SOURCES_DEMO) $(LDFLAGS)

.PHONY: all clean

clean:
	-rm sha2_224_test sha2_256_test sha2_384_test sha2_512_test sha2_512_224_test sha2_512_256_test sha2_224_demo sha2_256_demo sha2_384_demo sha2_512_demo sha2_512_224_demo sha2_512_256_demo