module testbench;
    reg A, B, C;
    wire sum, carry;

    // Instantiate the Full Adder
    full_adder FA (
        .A(A),
        .B(B),
        .C(C),
        .sum(sum),
        .carry(carry)
    );

    initial begin
        $monitor("Time = %t, A = %b, B = %b, C = %b, SUM = %b, CARRY = %b", $time, A, B, C, sum, carry);
        A = 0; B = 0; C = 0; #10;
        A = 0; B = 0; C = 1; #10;
        A = 0; B = 1; C = 0; #10;
        A = 0; B = 1; C = 1; #10;
        A = 1; B = 0; C = 0; #10;
        A = 1; B = 0; C = 1; #10;
        A = 1; B = 1; C = 0; #10;
        A = 1; B = 1; C = 1; #10;
        $finish;
    end
endmodule
