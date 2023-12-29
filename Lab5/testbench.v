module testbench;

// Inputs
reg [3:0] addr;
reg [7:0] data;
reg we;
reg enable;

// Output
wire [7:0] q;

// Instantiate the RAM module
single_port_ram spram (
    .addr(addr),
    .data(data),
    .we(we),
    .enable(enable),
    .q(q)
);

initial begin
    // Initialize Inputs
    addr = 0;
    data = 0;
    we = 0;
    enable = 0;
    
    // Wait 100 ns for global reset to finish
    #100;
    
    // Start the test
    enable = 1; // Enable the RAM
    we = 1;     // Enable write operation
    addr = 4'b0010; // Select address
    data = 8'b10101010; // Data to write
    #10; // Wait for the write operation
    
    we = 0;     // Disable write for reading
    addr = 4'b0010; // Same address to read the data back
    #10; // Wait for the read operation
    
    // Continue with more test cases as required
    // ...

    $finish; // End simulation
end

initial begin
    $monitor("At time %t, addr = %h, data = %h (written), q = %h (read), we = %b, enable = %b", $time, addr, data, q, we, enable);
end

endmodule
