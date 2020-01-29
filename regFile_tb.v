// Name: Nadim El Helou, Karim Khalil
// BU ID: U36258772, U35935771
// EC413 Project: Register File Test Bench

`timescale 1ns / 1ps

module regFile_tb();

reg clock, reset;

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/

// inputs
reg wEn = 0; 
reg [31:0] write_data;
reg [4:0] read_sel1;
reg [4:0] read_sel2;
reg [4:0] write_sel;

// outputs
wire [31:0] read_data1;
wire [31:0] read_data2;

// Fill in port connections
regFile uut (
  .clock(clock),
  .reset(reset),
  .wEn(wEn), // Write Enable
  .write_data(write_data),
  .read_sel1(read_sel1),
  .read_sel2(read_sel2),
  .write_sel(write_sel),
  .read_data1(read_data1),
  .read_data2(read_data2)
);


always #5 clock = ~clock;

initial begin
  clock = 1'b1;
  reset = 1'b1;
  wEn = 1'b1;
  write_data = 32'b0;
  read_sel1 = 5'b0;
  read_sel2 = 5'b0;
  write_sel = 5'b0;

  #20;
  reset = 1'b0;
  wEn = 1'b1;
  write_sel = 5'd1;
  write_data = 5'h00000009;

  #20
  wEn = 1'b1;
  write_sel = 5'd2;
  write_data = 5'h00000005;
  
  #20
  wEn = 1'b1;
  write_sel = 5'd0;
  write_data = 5'h00000004;
  
  #20
  write_sel = 5'b0;
  read_sel1 = 5'b00001;
  read_sel2 = 5'b00010;
  
  
  #20
  $display("Register 1: %d", read_data1);
  $display("Register 2: %d", read_data2); 
  
  // Test reads and writes to the register file here
  
 end

endmodule