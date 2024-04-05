`timescale 1ns / 1ps

module tb_sha2core();
    
    parameter PERIOD = 10;
    
    reg                     clk;
    reg                     rst;
    reg                     load;
    reg                     start;
    wire                    end_op;
    reg   [32-1:0]          data_in;
    wire  [(8*32 - 1): 0]   H_out;
    
    wire [31:0] probe1;
    wire [31:0] probe2;
    wire [31:0] probe3;
    wire [31:0] probe4;
    
    sha2_core_probe sha2_core (
        .clk(clk), 
        .rst(rst),
        .load(load),
        .start(start),
        .end_op(end_op),
        .data_in(data_in),
        .H_out(H_out),
        .probe1(probe1),
        .probe2(probe2),
        .probe3(probe3),
        .probe4(probe4)
    );
    
    
    initial begin
        #(PERIOD/2);
        rst = 0; load = 0; start = 0; data_in = 0;              #(10*PERIOD);
        rst = 1; load = 1; start = 0; data_in = 32'h61626380;   #(PERIOD); // 1
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 2
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 3
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 4
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 5
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 6
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 7
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 8
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 9
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 10
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 11
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 12
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 13
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 14
        rst = 1; load = 1; start = 0; data_in = 0;              #(PERIOD); // 15
        rst = 1; load = 1; start = 0; data_in = 32'h00000018;   #(PERIOD); // 16
        rst = 1; load = 0; start = 1; data_in = 0; #(PERIOD); // START
        
    
    end
    
    always begin
    clk = 0; #(PERIOD/2); clk = 1; #(PERIOD/2);
    end
    
endmodule
