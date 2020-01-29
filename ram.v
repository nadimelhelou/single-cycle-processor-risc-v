// Name: Nadim El Helou, Karim Khalil
// BU ID: U36258772, U35935771
// EC413 Project: Ram Module

`timescale 1ns / 1ps

module ram #(
  parameter DATA_WIDTH = 32,
  parameter ADDR_WIDTH = 16
) (
  input  clock,

  // Instruction Port
  input  [ADDR_WIDTH-1:0] i_address,
  output [DATA_WIDTH-1:0] i_read_data,

  // Data Port
  input  wEn,
  input  [ADDR_WIDTH-1:0] d_address,
  input  [DATA_WIDTH-1:0] d_write_data,
  output [DATA_WIDTH-1:0] d_read_data

);

localparam RAM_DEPTH = 1 << ADDR_WIDTH;

reg [DATA_WIDTH-1:0] ram [0:RAM_DEPTH-1];

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/

// Instruction
assign i_read_data = ram[i_address[15:2]];

// Data
assign d_read_data = ram[d_address[15:2]];

always @ (posedge clock) begin
    if (wEn) begin
        ram[d_address[15:2]] <= d_write_data;
    end
end

endmodule