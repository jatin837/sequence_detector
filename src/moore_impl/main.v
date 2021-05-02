module Sequence_Detector_MOORE(sequence_in,
  clock,
  reset,
  detector_out
);
input clock; // clock signal
input reset; // reset input
input sequence_in; // binary input
output reg detector_out; // output of the sequence detector
parameter  A=3'b000, // "Zero" State
  B=3'b001, // "One" State
  C=3'b010, // "OneZero" State
  D=3'b011, // "OneZeroOne" State
  E=3'b100;// "OneZeroOneOne" State
reg [2:0] current_state, next_state; // current state and next state
// sequential memory of the Moore FSM
always @(posedge clock, posedge reset)
begin
 if(reset==1) 
 current_state <= A;// when reset=1, reset the state of the FSM to "A" State
 else
 current_state <= next_state; // otherwise, next state
end 
// combinational logic of the Moore FSM
// to determine next state 
always @(current_state,sequence_in)
begin
 case(current_state) 
 A:begin
  if(sequence_in==1)
   next_state = B;
  else
   next_state = A;
 end
 B:begin
  if(sequence_in==0)
   next_state = C;
  else
   next_state = B;
 end
 C:begin
  if(sequence_in==0)
   next_state = A;
  else
   next_state = D;
 end 
 D:begin
  if(sequence_in==0)
   next_state = C;
  else
   next_state = E;
 end
 E:begin
  if(sequence_in==0)
   next_state = C;
  else
   next_state = B;
 end
 default:next_state = A;
 endcase
end
// combinational logic to determine the output
// of the Moore FSM, output only depends on current state
always @(current_state)
begin 
 case(current_state) 
 A:   detector_out = 0;
 B:   detector_out = 0;
 C:  detector_out = 0;
 D:  detector_out = 0;
 E:  detector_out = 1;
 default:  detector_out = 0;
 endcase
end 
endmodule
