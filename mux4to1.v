module mux4to1(
    input [3:0] a,       // 4-bit input
    input [1:0] sel,     // 2-bit selection line
    output reg y         // 1-bit output
);

always @(*) begin
    case(sel)
        2'b00: y = a[0];
        2'b01: y = a[1];
        2'b10: y = a[2];
        2'b11: y = a[3];
        default: y = 1'bx; // Undefined state
    endcase
end

endmodule
