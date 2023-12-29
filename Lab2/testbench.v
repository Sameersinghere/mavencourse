module testbench;

// Declare inputs as regs and outputs as wires
reg [3:0] command;
reg [7:0] a, b;
reg oe;
wire [15:0] dout;

// Instantiate the ALU
ALU alu_instance(
    .command(command),
    .a(a),
    .b(b),
    .oe(oe),
    .dout(dout)
);

initial begin
    // Initialize all inputs
    command = 4'b0;
    a = 8'b0;
    b = 8'b0;
    oe = 1'b0;

    // Wait for 100 ns for global reset to finish
    #100;
    oe = 1'b1; // Enable output

    // Test Add operation
    command = 4'b0000; a = 8'd15; b = 8'd10; #10;
    // Test Increment operation
    command = 4'b0001; a = 8'd5; #10;
    // Test Subtract operation
    command = 4'b0010; a = 8'd20; b = 8'd10; #10;
    // Test Decrement operation
    command = 4'b0011; a = 8'd9; #10;
    // Test Multiply operation
    command = 4'b0100; a = 8'd3; b = 8'd4; #10;
    // Test Divide operation
    command = 4'b0101; a = 8'd10; b = 8'd2; #10;
    // Test Shift right operation
    command = 4'b0110; a = 8'd4; #10;
    // Test Shift left operation
    command = 4'b0111; a = 8'd4; #10;
    // Test And operation
    command = 4'b1000; a = 8'd12; b = 8'd5; #10;
    // Test Or operation
    command = 4'b1001; a = 8'd12; b = 8'd5; #10;
    // Test Invert operation
    command = 4'b1010; a = 8'd15; #10;
    // Test Nand operation
    command = 4'b1011; a = 8'd15; b = 8'd10; #10;
    // Test Nor operation
    command = 4'b1100; a = 8'd15; b = 8'd10; #10;
    // Test Xor operation
    command = 4'b1101; a = 8'd15; b = 8'd10; #10;
    // Test Xnor operation
    command = 4'b1110; a = 8'd15; b = 8'd10; #10;
    // Test Buffer operation
    command = 4'b1111; a = 8'd8; #10;

    $finish;
end

initial begin
    $monitor("Time = %d : Command = %b, A = %d, B = %d, OE = %b, DOUT = %b", $time, command, a, b, oe, dout);
end

endmodule
