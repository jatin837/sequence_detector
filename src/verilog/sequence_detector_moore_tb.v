`timescale 1ns / 1ps
module tb_Sequence_Detector_Moore_FSM_Verilog;

 // Inputs
 reg sequence_in;
 reg clock;
 reg reset;

 // Outputs
 wire detector_out;

 // Instantiate the Sequence Detector using Moore FSM
 Sequence_Detector_MOORE_Verilog uut (
  .sequence_in(sequence_in), 
  .clock(clock), 
  .reset(reset), 
  .detector_out(detector_out)
 );
integer i;
 initial begin
    clock = 0;
    for (i = 0; i <= 40; i = i + 1)
        #5 clock = ~clock;
 end

 initial begin
  // Initialize Inputs
  sequence_in = 0;
  reset = 1;
  // Wait 100 ns for global reset to finish
  #30;
    reset = 0;
//--start

#10; sequence_in = 1
;

#10; sequence_in = 1
;

#10; sequence_in = 1
;

#10; sequence_in = 1
;

#10; sequence_in = 0
;

#10; sequence_in = 1
;

#10; sequence_in = 0
;

#10; sequence_in = 0
;

#10; sequence_in = 0
;

#10; sequence_in = 0
;

#10; sequence_in = 1
;

#10; sequence_in = 0
;

#10; sequence_in = 1
;

#10; sequence_in = 0
;

#10; sequence_in = 0
;

#10; sequence_in = 1
;

#10; sequence_in = 1
;

#10; sequence_in = 1
;
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
