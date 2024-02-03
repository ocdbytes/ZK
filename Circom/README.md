# Circom

## To compile a specific circuit

```sh
yarn circom:dev --circuit simple-polynomial
```

### This will generate files

```sh
- simple-polynomial.r1cs
- simple-polynomial.vkey.json
- simple-polynomial.wasm
- simple-polynomial.zkey
- verifier.sol
```

`simple-polynomial.r1cs :`
It is a simple R1CS representation of the circuit. It will be a binary file containing all the arithmetization, representing a low level representation of the circuit logic.

`simple-polynomial.wasm :`
WASM file will contain the logic of the all the calculations inside the circuit and witness generation.

`simple-polynomial.vkey.json :`
Verification key. It will go into smart contract or into your backend verification system.

`simple-polynomial.zkey :`
Proving key. It will go into the main user client or your web client application.

`verifier.sol :`
It will be a smart contract that one contract can inherit or it can be deployed separately on chain and it will contain our verification key.

### More Resources

- [R1CS file format](https://github.com/iden3/r1csfile/blob/master/doc/r1cs_bin_format.md)
