# fault testing

This repo was made for an assignment for my design for testability course during my undergraduate program.

## Problem: FAULT INJECTION AND DETECTION

The Aim was to demonstrate fault injection and detection in combinational circuits for atleast 2 stuck at faults. A 4 bit ripple carry adder was chosen for this particular problem and the code was written in verilog using iverilog and waveforms were verified using gtkwave.

## Approach

A 4 bit ripple carry adder was designed using 4 1-bit full adders as the propagation of carry was easy to implement for this particular circuit. The stuck at 1 faults were injected using OR gates and stuck at 0 faults were injected using AND gate. The fault_adder.v file contains ripple carry adder circuit and tb_fault_adder.v contains the testbench.

## Run command:

```
iverilog -g2012 -o fault_adder.v tb_fault_adder.v
vvp fault_test
gtkwave fault_adder.vcd

```


