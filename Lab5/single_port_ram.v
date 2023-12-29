module single_port_ram(
    input [3:0] addr,  // 4-bit address for 16 memory locations
    input [7:0] data,  // 8-bit data input
    input we,          // Write enable signal
    input enable,      // RAM enable signal
    output reg [7:0] q // 8-bit data output
);

// Declare the RAM variable
reg [7:0] ram[15:0];

// Write operation
always @(posedge enable) begin
    if (we) begin
        ram[addr] <= data;
    end
end

// Read operation
always @(*) begin
    if (enable && !we) begin
        q <= ram[addr];
    end else begin
        q <= 8'bz; // High impedance when not enabled or during write
    end
end

endmodule
