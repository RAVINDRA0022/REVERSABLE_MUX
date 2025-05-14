module reversible_mux(
    input  [3:0] in,
    input  [1:0] sel,
    output out
);
    wire y01, y23;

    fredkin mux1 (
        .A(sel[0]),
        .B(in[0]),
        .C(in[1]),
        .P(),
        .Q(y01),
        .R()
    );

    fredkin mux2 (
        .A(sel[0]),
        .B(in[2]),
        .C(in[3]),
        .P(),
        .Q(y23),
        .R()
    );

    fredkin mux3 (
        .A(sel[1]),
        .B(y01),
        .C(y23),
        .P(),
        .Q(out),
        .R()
    );
endmodule

module fredkin(
    input A, B, C,
    output P, Q, R
);
    assign P = A;
    assign Q = (~A & B) | (A & C);
    assign R = (~A & C) | (A & B);
endmodule
