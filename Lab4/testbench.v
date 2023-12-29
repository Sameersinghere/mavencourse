module testbench;

// Inputs
reg d;
reg clk;
reg reset;

// Outputs
wire q;
wire q_bar;

// Instantiate the Unit Under Test (UUT)
d_flip_flop uut (
    .d(d), 
    .clk(clk), 
    .reset(reset), 
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle clock every 5 time units
end

// Test sequence
initial begin
    // Initialize Inputs
    d = 0;
    reset = 1; // Reset the flip-flop
    #10;
    reset = 0; // Release the reset
    #10;
    
    // Apply input pattern and observe outputs
    d = 1; #10; // Set D, should reflect on Q at next clock edge
    d = 0; #10; // Clear D, should reflect on Q at next clock edge
    d = 1; #10; // Set D, should reflect on Q at next clock edge
    // Continue with more test patterns as necessary
    
    // Assert reset to see if the outputs go to their reset states
    reset = 1; #10;
    reset = 0; #10;

    $finish; // End simulation
end

initial begin
    $monitor("At time %t, reset = %b, d = %b, q = %b, q_bar = %b", $time, reset, d, q, q_bar);
end

endmodule
