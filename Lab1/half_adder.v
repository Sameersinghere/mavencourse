module half_adder(
    input A,
    input B,
    output sum,
    output carry
);
    assign sum = A ^ B; // XOR for sum
    assign carry = A & B; // AND for carry
endmodule

// Define a Full Adder module using two half adders and an OR gate
module full_adder(
    input A,
    input B,
    input C,
    output sum,
    output carry
);
    wire sum_first, carry_first, carry_second;

    // Instantiate the first half adder
    half_adder HA1 (
        .A(A),
        .B(B),
        .sum(sum_first),
        .carry(carry_first)
    );

    // Instantiate the second half adder
    half_adder HA2 (
        .A(sum_first),
        .B(C),
        .sum(sum),
        .carry(carry_second)
    );

    // OR gate for the final carry
    assign carry = carry_first | carry_second;
endmodule
