module sequence_detector(
    input din,
    input clk,
    input reset,
    output reg dout
);

// State declaration
typedef enum reg [1:0] {
    IDLE = 2'b00,
    S1 = 2'b01,
    S2 = 2'b10,
    S3 = 2'b11
} state_type;

// State variables
state_type current_state, next_state;

// State transition logic
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= IDLE;
    end else begin
        current_state <= next_state;
    end
end

// Next state logic based on current state and input
always @(*) begin
    case (current_state)
        IDLE:
            next_state = din ? S1 : IDLE;
        S1:
            next_state = din ? S1 : S2;
        S2:
            next_state = din ? S3 : IDLE;
        S3:
            next_state = din ? S1 : IDLE;
        default:
            next_state = IDLE;
    endcase
end

// Output logic
always @(current_state) begin
    dout = (current_state == S3) ? 1'b1 : 1'b0;
end

endmodule
