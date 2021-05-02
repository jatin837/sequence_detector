`timescale 1ns / 1ps
module tb_Sequence_Detector_Moore_FSM_Verilog;

 // Inputs
 reg sequence_in;
 reg clock;
 reg reset;

 // Outputs
 wire detector_out;

 // Instantiate the Sequence Detector using Moore FSM
 Sequence_Detector_MOORE uut (
  .sequence_in(sequence_in), 
  .clock(clock), 
  .reset(reset), 
  .detector_out(detector_out)
 );
integer i;
 initial begin
    clock = 0;

//--for
for (i = 0; i <= 1040; i = i+1)
#7.5 clock = ~clock;

 end

 initial begin
sequence_in = 0;

//--start
reset = 1;
#45;
reset = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 0;

#15; sequence_in = 1;

#15; sequence_in = 1;

#15; sequence_in = 0;
//--end


   end
 initial begin
     $monitor("At time = %t, Detector = %d\n", $time, detector_out);
 end
 initial begin
     $dumpfile("res_wave_moore_machine.vcd");
     $dumpvars(0, tb_Sequence_Detector_Moore_FSM_Verilog);
 end
    
endmodule
