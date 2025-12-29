`timescale 1ns / 1ps

module dual_port_RAM_tb();
    // Clock
    reg clk;

    // Port A signals
    reg we_a;
    reg [9:0]  addr_a;
    reg [31:0] data_a;
    wire [31:0] out_a;

    // Port B signals
    reg we_b;
    reg [9:0]  addr_b;
    reg [31:0] data_b;
    wire [31:0] out_b;

dual_port_RAM dut(
    .clk(clk),

    .we_a(we_a),
    .addr_a(addr_a),
    .data_a(data_a),
    .out_a(out_a),

    .we_b(we_b),
    .addr_b(addr_b),
    .data_b(data_b),
    .out_b(out_b)
 );

    // Clock generation (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        we_a = 0;
        we_b = 0;
        addr_a = 0;
        addr_b = 0;
        data_a = 0;
        data_b = 0;

        // Write using Port A
        #10;
        we_a = 1;
        addr_a = 10'd5;
        data_a = 32'hDEADBEEF;

        #10;
        we_a = 1;
        addr_a = 10'd100;
        data_a = 32'h12345678;

        #10;
        we_a = 0; // stop writing

        // Read using Port A
        #10;
        addr_a = 10'd5;

        #10;
        addr_a = 10'd100;

        // Write using Port B
        #10;
        we_b = 1;
        addr_b = 10'd200;
        data_b = 32'hCAFEBABE;

        #10;
        we_b = 0;

        // Read using Port B
        #10;
        addr_b = 10'd200;

        // Simultaneous access
        #10;
        we_a = 1;
        addr_a = 10'd300;
        data_a = 32'hAAAAAAAA;

        we_b = 0;
        addr_b = 10'd300;

        #10;
        we_a = 0;

        // Finish simulation
        #20;
        $finish;
    end

endmodule
