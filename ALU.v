// Name: Nadim El Helou, Karim Khalil
// BU ID: U36258772, U35935771
// EC413 Project: ALU

`timescale 1ns / 1ps

module ALU (
  input branch_op,
  input [5:0]  ALU_Control,
  input [31:0] operand_A,
  input [31:0] operand_B,
  output [31:0] ALU_result,
  output branch
);

/******************************************************************************
*                      Start Your Code Here
******************************************************************************/

wire signed [31:0]opA, opB, slt, sgte;
assign opA = operand_A;
assign opB = operand_B;
assign slt = opA < opB;
assign sgte = opA >= opB;

assign ALU_result = (ALU_Control == 6'b000000)? (operand_A + operand_B) :                         // add
                    (ALU_Control == 6'b001000)? (operand_A - operand_B) :                         // substract
                    (ALU_Control == 6'b011111 || ALU_Control == 6'b111111)? (operand_A) :         // pass operand_A
                    
                    (ALU_Control == 6'b000100)? (operand_A ^ operand_B) :                         // bitwise xor
                    (ALU_Control == 6'b000110)? (operand_A | operand_B) :                         // bitwise or
                    (ALU_Control == 6'b000111)? (operand_A & operand_B) :                         // bitwise and
                    
                    (ALU_Control == 6'b000001)? (operand_A << operand_B) :                        // logical shift left
                    (ALU_Control == 6'b000101)? (operand_A >> operand_B) :                        // logical shift right
                    (ALU_Control == 6'b001101)? (operand_A >>> operand_B) :                       // arithmetic shift 
                    
                    (ALU_Control == 6'b010000)? (operand_A == operand_B) :                                // equals
                    (ALU_Control == 6'b010001)? (operand_A != operand_B) :                                // not equals
                    (ALU_Control == 6'b000010) ? (slt):                                                   // signed less than 
                    (ALU_Control == 6'b010110 || ALU_Control == 6'b000011) ? (operand_A < operand_B):     // unsigned less than 
                    (ALU_Control == 6'b010101) ? (sgte):                                                  // signed greater than or equal
                    (ALU_Control == 6'b010111) ? (operand_A >= operand_B): 0;                             // unsigned greater than or equal
                    


assign branch = (branch_op == 0)? 1'b0 :
                ((ALU_Control == 6'b010000) && (operand_A == operand_B))? 1'b1 :            // branch if equals
                ((ALU_Control == 6'b010001) && (operand_A != operand_B))? 1'b1 :            // branch if not equal  
                ((ALU_Control == 6'b000010) && (slt))? 1'b1 :                               // branch if signed less than //010100
                ((ALU_Control == 6'b010101) && (sgte))? 1'b1 :                              // branch if signed greater than or equals
                ((ALU_Control == 6'b010110) && (operand_A < operand_B))? 1'b1 :             // branch if unsigned less than
                ((ALU_Control == 6'b010111) && (operand_A >= operand_B))? 1'b1 : 1'b0;      // branch if unsigned greater than or equals

endmodule