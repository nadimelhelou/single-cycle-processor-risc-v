// Name: Nadim El Helou, Karim Khalil
// BU ID: U36258772, U35935771
// EC413 Project: Fetch Module

`timescale 1ns / 1ps

module fetch #(
  parameter ADDRESS_BITS = 16
) (
  input  clock,
  input  reset,
  input  next_PC_select,
  input  [ADDRESS_BITS-1:0] target_PC,
  output [ADDRESS_BITS-1:0] PC
);

reg [ADDRESS_BITS-1:0] PC_reg;

assign PC = PC_reg;

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/
always @(posedge clock) begin
    if (reset == 1)
        PC_reg <= 16'b0;
    else if (next_PC_select == 0)
        PC_reg <= PC_reg + 16'b0000000000000100;
    else if (next_PC_select == 1)
        PC_reg <= target_PC;
end

endmodule
