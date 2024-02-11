pragma circom 2.1.6;

include "circomlib/poseidon.circom";
include "circomlib/mimcsponge.circom";
// include "https://github.com/0xPARC/circom-secp256k1/blob/master/circuits/bigint.circom";

// We can use `log` to print outputs :
//     log("hash", hash.out);
// ZkHashes Webiste : https://zk-hashes.vercel.app/
// 0xPARC : Group sign
// https://0xparc.org/blog/zk-group-sigs

// template PubKeyGen () {
//     signal input sk_in;
//     signal output pk_out;

//     // computes pk from sk
// }

template SigVerify () {
    signal input sk;
    signal input pk;

    component pkGen = MiMCSponge(1,220,1);
    pkGen.ins[0] <== sk;
    pk <== pkGen.outs[0];
}

template GroupSig () {
    signal input sk;

    signal input pk1;
    signal input pk2;
    signal input pk3;

    signal input msgHash;

    signal output attestation;


    component pkGen = MiMCSponge(1, 220, 1);
    pkGen.ins[0] <== sk;
    pkGen.k <== 0;

    signal pk;
    pk <== pkGen.outs[0];

    signal interim;
    interim <== (pk - pk1) * (pk - pk2);
    interim * (pk - pk3) === 0;

    // dummy check so that one cannot prove the proof for same message hash again and again.
    // signal dummy;
    // dummy <== msgHash * msgHash;
    // We can do the same thing by making an attestation stating that our particular private key is linked to msgHash

    component attestGen = MiMCSponge(2, 220, 1);
    attestGen.ins[0] <== sk;
    attestGen.ins[1] <== msgHash;
    attestGen.k <== 0;

    attestation <== attestGen.outs[0];
}

template RevealSigner () {
    signal input sk;
    signal input pk;
    signal input msgHash;
    signal input attestation;
``
    // prove : PubKeyGen(sk) === pk
    // prove : Hash(sk, msg) === attestation
}

component main { public [ pk1, pk2, pk3, msgHash ] } = GroupSig();

/* INPUT = {
    "sk": "42",
    "pk1": "10644022205700269842939357604110603061463166818082702766765548366499887869490",
    "pk2": "500",
    "pk3": "501",
    "msgHash" : "10"
} */

/**
 * Input Breakdown :
 * ----------------
 * sk : [private] private key which we have and claim to know the public key of
 * pk1 : [public] public key which we have
 * pk2 : [public] public key #2
 * pk3 : [public] public key #3
 * msgHash : [public] message hash
 */