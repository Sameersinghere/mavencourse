module mux4to1_tb;

// Inputs
reg [3:0] a;
reg [1:0] sel;

// Output
wire y;

// Instantiate the Unit Under Test (UUT)
mux4to1 uut (
    .a(a), 
    .sel(sel), 
    .y(y)
);

initial begin
    // Initialize Inputs
    a = 4'b1010; // Example input
    sel = 2'b00; // Select bit 0 initially
    #10;
    
    sel = 2'b01; // Select bit 1
    #10;
    
    sel = 2'b10; // Select bit 2
    #10;
    
    sel = 2'b11; // Select bit 3
    #10;
    
    // Add additional test cases as needed
    
    $finish; // End simulation
end

initial begin
    $monitor("At time %t, with selection %b, output is %b", $time, sel, y);
end

endmodule
