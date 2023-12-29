module d_flip_flop(
    input d,
    input clk,
    input reset,
    output reg q,
    output reg q_bar
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 1'b0;
        q_bar <= 1'b1;
    end else begin
        q <= d;
        q_bar <= ~d;
    end
end

endmodule
