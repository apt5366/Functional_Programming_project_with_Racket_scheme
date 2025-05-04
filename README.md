Ackermann Function with Memoization in Racket

This project demonstrates the implementation of the Ackermann function in Racket (#lang racket) using both a standard recursive approach and a memoized (cached) version to optimize repeated function calls. It also showcases basic use of functional constructs and closures in Racket.

What the Code Does:

Ackermann Function (ackermann):
-A classic example of a deeply recursive function.
-Very computationally intensive even for small inputs.
-Written using a pure recursive definition.

Memoization with Global State (ackermann_mem):
-Introduces a global association list al to store previously computed results.
-Uses bind and lookup functions to manage key-value pairs.
-Reuses results if the same arguments are passed again (memoization hit).

Functional Memoization (construct_mem)
-A more functional and encapsulated approach.
-construct_mem is a higher-order function that takes any two-argument function and returns a memoized version of it.
-Demonstrates use of closures to keep internal state private.

Tests

The code includes two sets of tests:

    Test 1: Using ackermann_mem with global memoization.

    Test 2: Using a closure-based memoized Ackermann (ackermannm) built from construct_mem.

Both demonstrate the effect of memoization by printing "memoization hit" when cached results are used.
