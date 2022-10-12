`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_decoder_2_to_4;
  logic ena;
  logic [1:0] in;
  wire [3:0] out;

  decoder_2_to_4 UUT(
    // way to make explicit the args by name rather than order
    .ena(ena), 
    .in(in), 
    .out(out)
  );

  initial begin
    // Collect waveforms
    $dumpfile("decoder_2_4.fst");
    $dumpvars(0, UUT);
    
    ena = 1;
    $display("ena in | out");
    for (int i = 0; i < 4; i = i + 1) begin
      in = i[1:0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end

    ena = 0;
    for (int i = 0; i < 4; i = i + 1) begin
      in = i[1:0];
      #1 $display("%1b %2b | %4b", ena, in, out);
    end
        
    $finish;      
	end

endmodule
