pragma circom 2.1.6;

include "circomlib/poseidon.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

// input : A field element from [0,16)
// output : 
// 4 signals : b0,b1,b2,b3 
// these 4 signals represent the binary representation of input
template Num2FourBits () {
    signal input x;

    signal output b0;
    signal output b1;
    signal output b2;
    signal output b3;

    b0 <-- x % 2;
    b1 <-- x \ 2 % 2;
    b2 <-- x \ 4 % 2;
    b3 <-- x \ 8 % 2;

    /**
     * same as above
     * -----------------------------
        b0 <-- x % 2;
        b1 <-- (x - b0) / 2 % 2;
        b2 <-- (x - 2 * b1 - b0) / 4 % 2;
        b3 <-- (x - 4 * b2 - 2 * b1 - b0) / 8 % 2;
     */

    b0 * (b0 - 1) === 0;
    b1 * (b1 - 1) === 0;
    b2 * (b2 - 1) === 0;
    b3 * (b3 - 1) === 0;

    1*b0 + 2*b1 + 4*b2 + 8*b3 === x;
}

template Num2Bits(nBits) {
    signal input x;
    signal output b[nBits];

    for (var i = 0; i < nBits; i++){
        b[i] <-- x \ (2**i) % 2;
    }

    for (var i = 0; i < nBits; i++){
        b[i] * (b[i] - 1) === 0;
    }

    var accum = 0;

    for(var i = 0; i < nBits; i++){
        accum += 2 ** i * b[i];
    }
    accum === x;
}

component main { public [ x ] } = Num2FourBits();

/* INPUT = {
    "x": "11"
} */