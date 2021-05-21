`timescale 1ns / 1ps
module tb_main_FSM_Verilog;

 // Inputs
 reg sequence_in;
 reg clock;
 reg reset;

 // Outputs
 wire detector_out;

 // Instantiate the Sequence Detector using Moore FSM
   main uut (
  .sequence_in(sequence_in), 
  .clock(clock), 
  .reset(reset), 
  .detector_out(detector_out)
 );
integer i;
 initial begin
    clock = 0;

//--for
for (i = 0; i <= 90; i = i+1)
#5.0 clock = ~clock;

 end

 initial begin
sequence_in = 0;

//--start
reset = 1;
#30;
reset = 0;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 1;

#10; sequence_in = 1;

#10; sequence_in = 1;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 1;

#10; sequence_in = 0;

#10; sequence_in = 1;

#10; sequence_in = 1;

#10; sequence_in = 1;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 1;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 0;

#10; sequence_in = 1;

#10; sequence_in = 1;

#10; sequence_in = 1;
//--end


   end
 initial begin
     $monitor("At time = %t, Detector = %d\n", $time, detector_out);
 end
 initial begin
     $dumpfile("res_wave_moore_machine.vcd");
     $dumpvars(0, tb_main_FSM_Verilog);
 end
    
endmodule
