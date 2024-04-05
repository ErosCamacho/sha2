`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2023 18:19:01
// Design Name: 
// Module Name: tb_sha2xl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_sha2xl();

    parameter PERIOD = 10;
    parameter MAX_SIZE = 200;
    parameter MAX_WIDTH = 51200; // 51200
    
    // tb parameter //
    parameter MODE = 256;
    parameter T = 0;
    
    parameter MAX_H = 8; // 6 (384); 7 (224); 8 (256,512); 4 (512_224, 512_256)
    parameter BLOCK_SIZE = 512; // 512 (224,256); 1024 (384,512) 
    parameter WIDTH = 32; // 32 (224,256); 64 (384,512)
    parameter SIZE_LEN = 2*WIDTH; // 64 (224,256) 128 (384,512)
    parameter MAX_BLOCK = MAX_WIDTH / BLOCK_SIZE;
    parameter test_ini = 56;
    parameter n_test = 1;
    parameter DBG = 0;
    
    
    reg                   clk;
    reg                   rst;
    reg  [3:0]            control;
    reg  [4:0]            ad_in;
    reg  [4:0]            ad_out;
    reg  [WIDTH-1:0]           data_in;
    wire  [WIDTH-1:0]          data_out;
    wire                  end_op;
    
    wire    [MODE-1:0]      H_out;
    reg     [WIDTH-1:0]          H [MAX_H-1:0];
    
    genvar j;
    generate
        for(j = 0; j < MAX_H; j = j + 1) begin
            assign H_out[(MAX_H-j)*WIDTH - 1:(MAX_H-1-j)*WIDTH] = H[j];
        end
    endgenerate
    
    integer i;
    
    sha2_xl #(
    .WIDTH(WIDTH),
    .MODE(MODE),
    .T(T)
    ) sha2_xl (
        .clk(clk),   
        .rst(rst),   
        .control(control),
        .ad_in(ad_in), 
        .ad_out(ad_out),
        .data_in(data_in),
        .data_out(data_out),
        .end_op(end_op)
    );
    
    reg [MAX_WIDTH-1:0] MEM_DATA [0:MAX_SIZE-1];
    reg [MAX_WIDTH-1:0] MEM_LENG [0:MAX_SIZE-1];
    reg [MODE-1:0]      MEM_RESU [0:MAX_SIZE-1];

    reg [MAX_WIDTH-1:0] DATA_SEL;
    reg [MAX_WIDTH-1:0] INPUT_DATA;
    reg [MAX_WIDTH-1:0] INPUT_LEN;
    
    reg [WIDTH-1:0] INPUT_MATRIX [15:0];
    
    integer test;
    integer add;
    integer fail; 
    integer len;
    integer block;
    integer n_block;
    
    initial begin
        if(MODE == 224 & T == 0) begin
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/DATA_NIST_224.txt",     MEM_DATA);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/LEN_NIST_224.txt",      MEM_LENG);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/RESULT_NIST_224.txt",   MEM_RESU);
        end
        else if(MODE == 256 & T == 0) begin
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/DATA_NIST_256.txt",     MEM_DATA);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/LEN_NIST_256.txt",      MEM_LENG);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/RESULT_NIST_256.txt",   MEM_RESU);
        end
        else if(MODE == 384 & T == 0) begin
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/DATA_NIST_384.txt",     MEM_DATA);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/LEN_NIST_384.txt",      MEM_LENG);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/RESULT_NIST_384.txt",   MEM_RESU);
        end
        else if(MODE == 512 & T == 0) begin
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/DATA_NIST_512.txt",     MEM_DATA);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/LEN_NIST_512.txt",      MEM_LENG);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/RESULT_NIST_512.txt",   MEM_RESU);
        end
        else if(MODE == 512 & T == 224) begin
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/DATA_NIST_512_224.txt",     MEM_DATA);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/LEN_NIST_512_224.txt",      MEM_LENG);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/RESULT_NIST_512_224.txt",   MEM_RESU);
        end
        else if(MODE == 512 & T == 256) begin
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/DATA_NIST_512_256.txt",     MEM_DATA);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/LEN_NIST_512_256.txt",      MEM_LENG);
        $readmemh("C:/Users/camacho/Desktop/sha2_xl/sha2_xl.srcs/sim_1/imports/SHA2/RESULT_NIST_512_256.txt",   MEM_RESU);
        end
        
        rst = 0; control = 4'b0000; ad_in = 0; data_in = 0; ad_out = 0; #(10*PERIOD); // RESET GEN
        rst = 1; control = 4'b0001; ad_in = 0; data_in = 0; ad_out = 0; #(10*PERIOD); // RESET CONTROL
        
        for(test = test_ini; test < (test_ini + n_test); test = test + 1) begin
            len = MEM_LENG[test];
            n_block = ((len + SIZE_LEN) / BLOCK_SIZE) + 1;
            
            $write("\n ----- TEST: %d ---- ",test); $write("LEN: %d",len);
            
            rst = 1; control = 4'b0001; ad_in = 0; data_in = 0; ad_out = 0; #(2*PERIOD); // RESET CONTROL
            DATA_SEL    = MEM_DATA [test];
            INPUT_LEN   = MEM_LENG [test];
            //PADDING;
            NO_PADDING;
            
            rst = 1; control = 4'b1000; // LOAD LENGTH
            ad_in = 0; #(PERIOD); data_in = INPUT_LEN[2*WIDTH-1:WIDTH]; #(PERIOD);
            ad_in = 1; #(PERIOD); data_in = INPUT_LEN[WIDTH-1:0];       #(PERIOD);
            #(PERIOD);
            
            for(block = 0; block < n_block; block = block + 1) begin
                MATRIX; 
                rst = 1; control = 4'b0010; // LOAD
                for (add = 0; add < 16; add = add + 1) begin
                    ad_in = add; #(PERIOD); data_in = INPUT_MATRIX[add]; #(PERIOD);
                end
                
                rst = 1; control = 4'b0100; #(PERIOD); // START
                while(!end_op) #(PERIOD);
            end
            for (i = 0; i < MAX_H; i = i + 1) begin
                ad_out = i; #(PERIOD);
                H[i] = data_out;
            end
            
            #(2*PERIOD);
            
            if(DBG) begin
                $write("\n       H_out: %x",H_out);
                $write("\n NIST_RESULT: %x",MEM_RESU[test]);
                $write("\n");
            end
            VERIFY;
            if      (fail & !DBG)  $write("\t FAIL");
            else if (fail & DBG)   $write("\n FAIL");
            else if (!fail & !DBG) $write("\t OK");
            else if (!fail & DBG)  $write("\n OK");
            
        end
        
       $display("\n");
        
    end
    
    always begin
    clk = 0; #(PERIOD/2); clk = 1; #(PERIOD/2);
    end
    
    task PADDING;
        assign INPUT_DATA = ((DATA_SEL << (MAX_WIDTH - INPUT_LEN)) + (1'b1 << (MAX_WIDTH - INPUT_LEN - 1)) + (INPUT_LEN << ((MAX_BLOCK - n_block) * BLOCK_SIZE)));
    endtask 
    
    task NO_PADDING;
        assign INPUT_DATA = (DATA_SEL << (MAX_WIDTH - INPUT_LEN));
    endtask 
    
    task MATRIX;
        integer i;
        for(i = 0; i < 16; i = i + 1) begin
            INPUT_MATRIX[15-i] = INPUT_DATA >> ((i*WIDTH) + (MAX_BLOCK - block - 1)*BLOCK_SIZE);
        end
    endtask
    
    task VERIFY;
        begin
            fail = 0;
            if      (T == 0     & H_out         != MEM_RESU[test]) fail = 1;
            else if (T == 256   & H_out[255:0]  != MEM_RESU[test]) fail = 1;
            else if (T == 224   & H_out[223:0]  != MEM_RESU[test]) fail = 1;
        end
    endtask
    
endmodule

//        ad_in = 0;  #(PERIOD);   data_in = 32'h61626380; #(PERIOD);
//        ad_in = 1;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 2;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 3;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 4;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 5;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 6;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 7;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 8;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 9;  #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 10; #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 11; #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 12; #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 13; #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 14; #(PERIOD);   data_in = 0;            #(PERIOD);
//        ad_in = 15; #(PERIOD);   data_in = 32'h00000018; #(PERIOD);
