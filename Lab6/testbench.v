module testbench;

reg din;
reg clk;
reg reset;
wire dout;

// Instantiate the sequence detector
sequence_detector sd(
    .din(din),
    .clk(clk),
    .reset(reset),
    .dout(dout)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = !clk; // Generate a clock with a period of 10 time units
end

// Stimulus
initial begin
    // Initialize
    din = 0;
    reset = 1; // Apply reset
    #10;
    reset = 0; // Release reset
    
    // Send the sequence "101" and check the output
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    
    // Send some more bits to test
    din = 0; #10;
    din = 1; #10;
    din = 0; #10;
    din = 1; #10;
    
    $finish; // End simulation
end

// Monitor
initial begin
    $monitor("At time %t, reset = %b, din = %b, dout = %b", $time, reset, din, dout);
end

endmodule
