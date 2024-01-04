// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IsSorted {
    /**
     * The goal of this exercise is to return true if the members of "arr" is sorted (in ascending order) or false if its not.
     */
    function isSorted(uint256[] calldata arr) public pure returns (bool) {
        // your code here
        require(arr.length != 0, "Array must be filled");
        for (uint i = 0; i < arr.length - 1; i++ ) {
            if (arr[i] > arr [i + 1]) {
                return false; // Found a pair of elements that are not in ascending order
            }
        }
        return true; // All elements are in ascending order
    }
}
