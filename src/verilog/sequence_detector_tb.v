`timescale 1ns / 1ps
module sequence_detector_1011_tb;

 // Inputs
 reg sequence_in;
 reg clock;
 reg reset;

 // Outputs
 wire detector_out;

 // Instantiate the Sequence Detector using Moore FSM
 sequence_detector_1011 uut (
  .sequence_in(sequence_in), 
  .clock(clock), 
  .reset(reset), 
  .detector_out(detector_out)
 );
integer i;
 initial begin
    clock = 0;
    for (i = 0; i <= 4000; i = i + 1)
        #5 clock = ~clock;
 end

 initial begin
  sequence_in = 0;
  reset = 1;
  #20;
  reset = 0;
  //append signals from you go code here for every 10 ps interval

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

#10; sequence_in = 1
;

#10; sequence_in = 1
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

#10; sequence_in = 0
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

#10; sequence_in = 1
;

#10; sequence_in = 1
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

#10; sequence_in = 1
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
//--end

end
 initial begin
     $monitor("At time = %t, Detector = %d\n", $time, detector_out);
 end
 initial begin
     $dumpfile("res_wave_mealy_machine.vcd");
     $dumpvars(0, sequence_detector_1011_tb);
 end
    
endmodule
