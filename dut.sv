module alu
  (
    input [2:0] mode,
    input [3:0] a,b,
    output reg [7:0] y
  );
  
  always@(*)
    begin
      case(mode)
        2'b00: y = a + b;    //addition
        2'b01: y = a - b;    //subtraction
        2'b10: y = a * b;    //multiplication
        2'b11: y = a / b;    //division
      endcase
    end
  
endmodule 
