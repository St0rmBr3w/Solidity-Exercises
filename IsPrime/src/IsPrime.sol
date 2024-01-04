// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsPrime {
    /**
     * The goal of this exercise is to return if "number" is prime or not (true or false)
     */
    function isPrime(uint256 number) public pure returns (bool) {
        // your code here
        if (number < 2) {
            return false; // 0 and 1 are not prime numbers
        }
        if (number == 2) {
            return true; // 2 is the only even prime number
        }
        if (number % 2 == 0) {
            return false; // All other even numbers are not prime
        }
        for (uint i = 3; i < number; i += 2) {
            if (number % i == 0) {
                return false; // Found a factor of 'number'
            }
        }
        return true; // No factors found, so it's a prime number
    }
}