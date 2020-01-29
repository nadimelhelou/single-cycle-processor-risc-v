// Name: Nadim El Helou, Karim Khalil
// BU ID: U36258772, U35935771
// EC413 Project: Ram Test Bench

`timescale 1ns / 1ps

module ram_tb();

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 16;

reg  clock;

// Instruction Port
reg  [ADDR_WIDTH-1:0] i_address;
wire [DATA_WIDTH-1:0] i_read_data;

// Data Port
reg  wEn;
reg  [ADDR_WIDTH-1:0] d_address;
reg  [DATA_WIDTH-1:0] d_write_data;
wire [DATA_WIDTH-1:0] d_read_data;


ram #(
  .DATA_WIDTH(DATA_WIDTH),
  .ADDR_WIDTH(ADDR_WIDTH)
) uut (
  .clock(clock),

  // Instruction Port
  .i_address(i_address),
  .i_read_data(i_read_data),

  // Data Port
  .wEn(wEn),
  .d_address(d_address),
  .d_write_data(d_write_data),
  .d_read_data(d_read_data)

);

always #5 clock = ~clock;


initial begin
  clock = 1'b1;
  d_address = 16'd0;
  d_write_data = 16'd0;
  wEn = 1'b0;

  #10
  wEn = 1'b1;
  #10
  $display("Data Address %d: %h", d_address, d_read_data);
  d_write_data = 1;
  d_address = 4;
  #10
  $display("Data Address %d: %h", d_address, d_read_data);
  d_write_data = 2;
  d_address = 8;
  #10
  $display("Data Address %d: %h", d_address, d_read_data);


  /***************************
  * Add more test cases here *
  ***************************/

  wEn = 1'b0;
  d_write_data = 4;
  d_address = 8;
  #10
  $display("Data Address %d: %h", d_address, d_read_data);
  
  
  i_address = 8;
  #10
  $display("Instruction address %d: %h", i_address, i_read_data);
  
  wEn = 1'b1;
  d_write_data = 69;
  d_address = 7;
  #10
  i_address = 7;
  #10
  $display("Instruction address %d: %h", i_address, i_read_data);
  
  wEn = 1'b0;
  d_write_data = 71;
  d_address = 7;
  #10
  $display("Data Address %d: %h", d_address, d_read_data);
  
  wEn = 1'b1;
  d_write_data = 100;
  d_address = 15;
  #10
  i_address = 8;
  #10
  $display("Instruction address %d: %h", i_address, i_read_data);
  

  #100
  
  
  $stop();

end

endmodule

