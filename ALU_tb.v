// Name: Nadim El Helou, Karim Khalil
// BU ID: U36258772, U35935771
// EC413 Project: ALU Test Bench

`timescale 1ns / 1ps

module ALU_tb();
reg branch_op;
reg [5:0] ctrl;
reg [31:0] opA, opB;

wire [31:0] result;
wire branch;

ALU dut (
  .branch_op(branch_op),
  .ALU_Control(ctrl),
  .operand_A(opA),
  .operand_B(opB),
  .ALU_result(result),
  .branch(branch)
);

initial begin
  branch_op = 1'b0;
  ctrl = 6'b000000;
  opA = 4;
  opB = 5;

  #10
  $display("ALU Result 4 + 5: %d",result);
  #10
  ctrl = 6'b000010;
  #10
  $display("ALU Result 4 < 5: %d",result);
  #10
  opB = 32'hffffffff;
  #10
  $display("ALU Result 4 < -1: %d",result);

  branch_op = 1'b1;
  opB = 32'hffffffff;
  opA = 32'hffffffff;
  ctrl = 6'b010_000; // BEQ
  #10
  $display("ALU Result (BEQ): %d",result);
  $display("Branch (should be 1): %b", branch);
  

/******************************************************************************
*                      Add Test Cases Here
******************************************************************************/
 #10
 
 branch_op = 1'b0;
 ctrl = 6'b000111;
 opA = 4;
 opB = 5;
 #10

 $display("ALU Result 4 & 5: %d",result);
 
  #10
  
  branch_op = 1'b0;
  ctrl = 6'b010001;
  opA = 5;
  opB = 3;
  #10

  $display("ALU Result 5 != 3: %d",result);
  
  #10
    
  branch_op = 1'b0;
  ctrl = 6'b00110;
  opA = 1;
  opB = 0;
  #10
  $display("ALU Result 1 | 0: %d",result);
    
  #10
      
  branch_op = 1'b0;
  ctrl = 6'b001000;
  opA = 5;
  opB = 3;
  #10
  $display("ALU Result 5 - 3: %d",result);
  
  #10
      
  branch_op = 1'b0;
  ctrl = 6'b010001;
  opA = 1;
  opB = 1;
  #10
  $display("Branch(should be 0): %b",branch);

  
    
              
      

  

end

endmodule