module ALU(
    input [3:0] command,
    input [7:0] a, b,
    input oe,
    output reg [15:0] dout
);

always @(*) begin
    if (oe) begin
        case (command)
            4'b0000: dout = a + b;
            4'b0001: dout = a + 1;
            4'b0010: dout = b - a;
            4'b0011: dout = a - 1;
            4'b0100: dout = a * b;
            4'b0101: dout = a / b; // Note: Division by zero needs to be handled
            4'b0110: dout = a >> 1;
            4'b0111: dout = a << 1;
            4'b1000: dout = a & b;
            4'b1001: dout = a | b;
            4'b1010: dout = ~a;
            4'b1011: dout = ~(a & b);
            4'b1100: dout = ~(a | b);
            4'b1101: dout = a ^ b;
            4'b1110: dout = ~(a ^ b);
            4'b1111: dout = {8'b0, a}; // Buffer operation with zero extension
            default: dout = 16'b0;
        endcase
    end else begin
        dout = 16'bz; // High impedance when oe is low
    end
end

endmodule
