
`timescale 1ns/1ps

module cpu_tb;
    reg clk;
    reg [7:0] instr;
    wire [2:0] alures, wd, r1, r2;

    // Instantiate the DUT (Device Under Test)
    cpu uut (
        .clk(clk),
        .instr(instr),
        .alures(alures),
        .wd(wd),
        .r1(r1),
        .r2(r2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize instruction
        instr = 8'b0;

        // Small delay before init
        #10;

        // === Initialize reg_file contents directly for testing ===
        // This assumes your reg_file has an array "regs"
        uut.r.mem[0] = 3'b001;  // R0 = 1
        uut.r.mem[1] = 3'b001;  // R1 = 2
        uut.r.mem[2] = 3'b011;  // R2 = 3
        uut.r.mem[3] = 3'b100;  // R3 = 4

        #10;

        // === Apply a few custom instructions ===
        instr = 8'b010_00_01_0;  // Example opcode + register fields
        
        #20;

        // Finish
        #50;
        $finish;
    end

    // Monitor outputs + regfile state
    initial begin
        $monitor("t=%0t | instr=%b | r1=%b r2=%b | ALU=%b | wd=%b | R0=%b R1=%b R2=%b R3=%b",
                 $time, instr, r1, r2, alures, wd,
                 uut.r.mem[0], uut.r.mem[1], uut.r.mem[2], uut.r.mem[3]);
    end

endmodule
