# ZK

This repository includes all the code implementations for zk-snark verifying systems from simple arithmetics behind it to the circuit design and working.

Book : The moonmath manual to zk-snarks

```sh
$ sage -n jupyter
```

Languages Used :

- Sage (for solving equations and plotting)
- Circom (to design zk circuits)

Modules :

- `ZK Arithmetics`
  - `Zk-Arithmetics-1.ipynb`
    - Basic Operations
    - Eucledean Division
    - Extended Eucledean Division (G.C.D.)
    - Number Representation
  - `Zk-Arithmetics-2.ipynb`
    - Modular Arithmetics
    - Fermat's little theorem
    - Solving Equations (using compatibility theorems)
    - Chinese Remainder Theorem
    - Remainder Class Representation
    - Modular Arithmetic & Operations
  - `Zk-Arithmetics-3.ipynb`
    - Polynomial Arithmetic
    - Operation on polynomial equations
    - Eucledean Division with polynomials
    - Irreducable Polinomial (prime factoring in polynomials)
    - Lagrange Interpolation
- `Zk Algebra`
  - `Zk-Algebra-1.ipynb`
    - Hashing Functions
    - Hashing to group
    - SHA256
