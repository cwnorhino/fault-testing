`timescale 1ns/1ps

//creating full adder to reuse it 

module full_adder(a,b,C_in,C_out,sum);
    input a,b,C_in;
    output C_out; 
    output sum;

//calculating sum and C_out of the full adder 

    assign sum = a^b^C_in; 
    assign C_out = (a & b)|(a^b) & C_in;

endmodule 

//creating 4-bit ripple carry adder :3


module rcd_adder(a,b,C_in,sum,C_out);

    input [3:0] a,b;
    input C_in;
    output [3:0] sum;
    output C_out;

    wire C1,C2,C3;

    full_adder FA0(a[0], b[0], C_in, C1, sum[0]);
    full_adder FA1(a[1], b[1], C1, C2, sum[1]);
    full_adder FA2(a[2], b[2], C2, C3, sum[2]);
    full_adder FA3(a[3], b[3], C3, C_out, sum[3]);

endmodule


//fault 1: stuck at 0 fault 

module rcd_adder_sa0(a,b,C_in,C_out,sum);

    input [3:0]a,b; 
    input C_in;
    output [3:0]sum; 
    output C_out;
    
    wire C1,C1_raw,C2,C3; 

    full_adder FA0(a[0], b[0], C_in, C1_raw, sum[0]);

    // AND gate forces the carry to 0

    and fault_sa0(C1, C1_raw, 1'b0);

    // Remaining full adders
    full_adder FA1(a[1], b[1], C1, C2, sum[1]);
    full_adder FA2(a[2], b[2], C2, C3, sum[2]);
    full_adder FA3(a[3], b[3], C3, C_out, sum[3]);

endmodule

//fault 2: stuck at 1

module rcd_adder_sa1(a,b,C_in,C_out,sum);

    input [3:0] a, b;
    input C_in;
    output [3:0] sum;
    output C_out;

    wire C1, C2_raw, C2, C3;

    // FA0 calculates the carry normally
    full_adder FA0(a[0], b[0], C_in, C1, sum[0]);

    // FA1 calculates the actual carry
    full_adder FA1(a[1], b[1], C1, C2_raw, sum[1]);

    // OR gate forces the carry to 1
    or fault_sa1(C2, C2_raw, 1'b1);

    // Remaining full adders
    full_adder FA2(a[2], b[2], C2, C3, sum[2]);
    full_adder FA3(a[3], b[3], C3, C_out, sum[3]);

endmodule





