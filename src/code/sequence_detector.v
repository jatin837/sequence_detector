module sequence_detector_1011(sequence_in,clock,reset,detector_out
    );
input clock; // clock signal
input reset; // reset input
input sequence_in; // binary input
output reg detector_out; // output of the sequence detector
parameter  A=3'b000, // "Zero" State
  B=3'b001, // "One" State
  C=3'b011, // "OneZero" State
  D=3'b010; // "OnceZeroOne" State
reg [2:0] current_state, next_state; // current state and next state
// sequential memory of the Moore FSM
always @(posedge clock, posedge reset)
begin
 if(reset==1) 
 current_state <= A;// when reset=1, reset the state of the FSM to "Zero" State
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
  begin
   next_state = B;
   detector_out = 0;
  end
  else
  begin
   detector_out = 0;
   next_state = A;
  end
 end
 B:begin
  if(sequence_in==0)
  begin
   next_state = C;
   detector_out = 0;
  end
  else
  begin
   next_state = B;
   detector_out = 0;
  end
 end
 C:begin
  if(sequence_in==0)
  begin
   next_state = A;
   detector_out = 0;
  end
  else
  begin
   next_state = D;
   detector_out = 0;
  end
 end 
 D:begin
  if(sequence_in==0)
  begin
   next_state = C;
   detector_out = 0;
  end
  else
  begin
   next_state = B;
   detector_out = 1;
  end
 end
 endcase
end
// combinational logic to determine the output
// of the Moore FSM, output only depends on current state
endmodule