# ZK

This repository includes all the code implementations for zk-snark verifying systems from simple arithmetics behind it to the circuit design and working.

```sh
prove(inputs, algorithm_description) -> (encrypted_inputs, proof, public_output)

verify(encrypted_inputs, proof, algorithm_description) == public_output
```

**Languages Used :**

- Sage (for solving equations over a field and plotting)
- Python (for visualising the proofs of theorems and polynomial operations)
- Circom (to design zk circuits)
- Markdown (for readme)

**Modules :**

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
  - `Set Theory`
    - Binary Operations in set theory
- `ECC (Eliptical Curve Cryptography)`
  - `ECC_1.ipynb`
    - ECC under finite field
  - `ECC_2.ipynb`
    - ECC under cyclic group
  - `ECC_3.ipynb`
    - Generator Points
    - ECC addition and modular addition homomorphism
    - Accosiativity
  - `ECC_4.ipynb`
    - ZK Proof Example using ECC
    - ECDSA malleability attack
- `Bilinear Pairings`
  - `BP_1.ipynb`
    - Bilinear Pairing Concepts
  - `precompile_test/`
    - 0x08 Precompile implementation
    - Simple test for working
- `R1CS`
  - `main.ipynb`
    - Transformation of Different Equations
    - Addition with constants
    - Multiplication with constants
  - `circuit/`
    - Multiply2()
    - witness generation
  - `circuit2/`
    - Multiply4()
- `Q.A.P`
  - `main.ipynb`
    - Example showing addition of two vectors is homomorphic to addition of two polynomials
    - Example showing hadamard product of two vectors is homomorphic to multiplication of two polynomials
    - Ex : Multiplying a vector by a scalar is homomorphic to multiplying the polynomial by the same scalar

**Setup :**

```sh
# For running the sage compiler
sage -n jupyter
```

**Sources :**

- [Moon Math manual](./main-moonmath.pdf)
- [zkSecureum puzzles](./zkSecureum_notes.pdf)
- [RareSkills ZK book](https://www.rareskills.io/zk-book)
- [0xPARC](https://learn.0xparc.org/materials/circom/learning-group-1/intro-zkp/)

**Dev Tools :**

- [Hardhat Circom](https://github.com/projectsophon/hardhat-circom)
- [Online Circom Compiler](https://zkrepl.dev/)
- [CircomLib](https://github.com/iden3/circomlib)
