// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract FilterOddNumbers {
    /*
        This exercise assumes you understand how to manipulate Array.
        1. Function `filterOdd` takes an array of uint256 as argument. 
        2. Filter and return an array with the odd numbers removed.
        Note: this is tricky because you cannot allocate a dynamic array in memory, 
              you need to count the even numbers then declare an array of that size.
    */

    function filterOdd(uint256[] memory _arr)
        public
        pure
        returns (uint256[] memory)
    {
        // your code here
        uint256 count = 0;

        // First pass to count even numbers
        for (uint i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                count++;
            }
        }

        // Declare a new array with the size equal to count of even numbers
        uint256[] memory evenArr = new uint256[](count);
        uint256 j = 0;

        // Second pass to populate the new array with even numbers
        for (uint256 i = 0; i < _arr.length; i++) {
            if (_arr[i] % 2 == 0) {
                evenArr[j] = _arr[i];
                j++;
            }
        }
        return evenArr;
    }
}
