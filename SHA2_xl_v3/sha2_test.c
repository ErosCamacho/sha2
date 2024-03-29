#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "pynq_api.h"
#include "sha2/common/Funciones_HW.h"
#include "sha2/common/Funcion_Test.h"
#include "sha2/hw/sha2_hw.h"
#include "sha2/sw/sha2_sw.h"
#include "sha2/hw/params.h"

void main(int argc, char** argv) {

	int DBG = 0;
	int v = 1;
	int b = 1;
	int ini = 0;
	int fin = 0;
	int n_test = 1;
	int stop = 0;

	for (int arg = 1; arg < argc; arg++) {

		if (argv[arg][0] == '-') {
			if (argv[arg][1] == 'h') {
				printf("\n Usage: ./sha2_XXX_test [-h] [-hh] [-v] [-b] [-n] [-s] \n");
				printf("\n -h : Show the help.");
				printf("\n -hh: Show the extended help.");
				printf("\n -v : Verbose Level:");
				printf("\n \t 1: Show the Acceleration of each NIST run (By default).");
				printf("\n \t 2: Show the Acceleration + Output Data of each NIST run.");
				printf("\n \t 3: Show the Acceleration + Input/Output Data of each NIST run.");
				printf("\n -b : Selection of NIST Bit Test.");
				printf("\n \t 1: Use the NIST Byte Test (By default).");
				printf("\n \t 2: Use the NIST Bit Test. WARNING: The reference SW is not prepared for this test.");
				printf("\n -n : [Number] of test executions.");
				printf("\n -s : Stop in each run.");
				printf("\n \n");

				if (argv[arg][2] == 'h') {
					printf("\n --- Extended Help --- ");
					printf("\n -i : Select de initial value for the sample run.");
					printf("\n -f : Select de final value for the sample run.");
					printf("\n \n");
				}


				return; 
			}
			else if (argv[arg][1] == 'v') {
				if (arg < argc - 1) v = atoi(argv[arg + 1]);
			}
			else if (argv[arg][1] == 'b') {
				if (arg < argc - 1) b = atoi(argv[arg + 1]);
			}
			else if (argv[arg][1] == 'n') {
				if (arg < argc - 1) n_test = atoi(argv[arg + 1]);
			}
			else if (argv[arg][1] == 'i') {
				if (arg < argc - 1) ini = atoi(argv[arg + 1]);
			}
			else if (argv[arg][1] == 'f') {
				if (arg < argc - 1) fin = atoi(argv[arg + 1]);
			}
			else if (argv[arg][1] == 's') {
				stop = 1;
			}
			else if (argv[arg][1] == 'd') {
				if (arg < argc - 1) DBG = atoi(argv[arg + 1]);
			}
			else {
				printf("\n Unknow option: %s\n", argv[arg]);
			}
		}
	}

	unsigned char *in;
	unsigned char out_hw[SIZE_OUTPUT];
	unsigned char *out_nist;
	unsigned long long int length;

	in		 = malloc(sizeof(unsigned char) * SIZE_INPUT);
	//out_hw	 = malloc(sizeof(unsigned char) * SIZE_OUTPUT);
	out_nist = malloc(sizeof(unsigned char) * SIZE_OUTPUT);

	unsigned long long tic = 0, toc;
	unsigned long long time_hw = 0, time_sw = 0;

	unsigned char *in_sw;
	unsigned char *out_sw;

	in_sw = malloc(sizeof(unsigned char) * SIZE_INPUT);
	out_sw = malloc(sizeof(unsigned char) * SIZE_OUTPUT);

	
	sha2_ctx ctx;

	load_bitstream(0);
	PYNQ_MMIO_WINDOW ms2xl;
	PYNQ_createMMIOWindow(&ms2xl, MS2XL_BASEADDR, MS2XL_LENGTH);

	// Evaluation of NIST Tests
	if (b == 1) { // bytetest
		//ini = 0;
		//fin = 172;
		if(ini == 0) ini = 0;
		if(fin == 0) fin = ((SIZE_BLOCK / 8) + 1) + 2*WIDTH;
		//fin = 2;
	}
	else { // bittest
		if(ini == 0) ini = 0;
		if(fin == 0) fin = (SIZE_BLOCK + 1) + 100; // 677
		//ini = 573;
		//fin = 576;
	}

	int total_pass_hw = 0;
	int total_pass_sw = 0;

		for (int test = 1; test <= n_test; test++) {
			printf("\n -------- TEST: %d --------- ", test);
			total_pass_hw = 0;
			total_pass_sw = 0;

			for (int sel = ini; sel < fin; sel++) {

				// Get NIST Data: Length, Input Data & Output Data
				input_nist(in, out_nist, &length, sel, b, DBG);
				int input_chars = ceil((float)length / 8);
				
				// SHA2 HW Execution
				tic = PYNQ_Wtime();
				sha2_hw(in, out_hw, length, ms2xl, DBG);
				time_hw = PYNQ_Wtime() - tic;

				// SHA2 SW Execution
				memcpy(in_sw, in, SIZE_INPUT);

				tic = PYNQ_Wtime();
				sha2_sw(&ctx, in_sw, input_chars, out_sw);
				time_sw = PYNQ_Wtime() - tic;
				
				// Comparison of results 
				int pass_hw = 1;
				for (int i = 0; i < SIZE_OUTPUT; i++) if (out_hw[i] != out_nist[i]) pass_hw = 0;
				if (pass_hw) ++total_pass_hw;
				int pass_sw = 1;
				for (int i = 0; i < SIZE_OUTPUT; i++) if (out_sw[i] != out_nist[i]) pass_sw = 0;
				if (pass_sw) ++total_pass_sw;

				// Print Result
				if (v >= 1) {
					printf("\n \t -- Run %d \t Msg. Length: %lld (bits) %lld (bytes) \t \t Acceleration: %.2f \t \t HW Pass: %d / %d", 
						sel+1, length, length / 8, ((float)(time_sw) / (float)(time_hw)), total_pass_hw, (fin-ini)); 
					if (pass_hw) printf(" OK"); else printf(" FAIL");
				}
				if (v >= 2) {
					printf("\n \t OUT_HW: \t");	for (int i = 0; i < SIZE_OUTPUT; i++) printf("%02x", out_hw[i]);		printf("\t (%6llu us.)", time_hw);
					printf("\n \t OUT_SW: \t");	for (int i = 0; i < SIZE_OUTPUT; i++) printf("%02x", out_sw[i]);		printf("\t (%6llu us.)", time_sw);
					printf("\n \t OUT_NIST: \t");	for (int i = 0; i < SIZE_OUTPUT; i++) printf("%02x", out_nist[i]);
					printf("\n \t CHECK_HW: \t"); if (pass_hw) printf("OK"); else printf("FAIL");
					printf("\n \t CHECK_SW: \t"); if (pass_sw) printf("OK"); else printf("FAIL");
				}
				if (v >= 3) {
					printf("\n \t IN: ");		for (int i = 0; i < input_chars; i++) printf("%02x", in[i]);
					printf("\n");
				}

				if (stop) {
					printf("\n \t \t -- Press any key to continue ... ");
					getchar();
				}
				
			}
		}
	printf("\n \n");
}
