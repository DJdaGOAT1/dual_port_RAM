`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/29/2025 04:39:14 PM
// Design Name: 
// Module Name: dual_port_RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dual_port_RAM(
    input [31:0] data_a, data_b, // data buses a and b
    input [9:0] addr_a, addr_b, // addresses of buses a and b
    input we_a, we_b, // supported write/read signals at port a & b
    input clk,
    output reg [31:0] out_a, out_b // two sets of output data bus
    );
    
    //defining the RAM to 1024x32 bit
    reg [31:0] ram[1023:0]; 
    
    // port a operation: 
    always @(posedge clk)
    begin
        if (we_a) //rising edge is write;
        begin
            ram[addr_a] <= data_a; //save data to mem
        end
        else
        begin
            out_a <= ram[addr_a]; //read data out
        end
    end
    
    //port b operation:
    always @ (posedge clk)
    begin
        if(we_b)
        begin
            ram[addr_b] <= data_b; //save data to mem
        end
        else
        begin
            out_b <= ram[addr_b]; //read data out
        end
    end
endmodule
