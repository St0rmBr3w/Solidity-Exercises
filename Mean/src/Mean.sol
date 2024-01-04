// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Mean {
    /**
     * The goal of this exercise is to return the mean of the numbers in "arr"
     */
    function mean(uint256[] calldata arr) public pure returns (uint256) {
        uint256 sum;
        require(arr.length != 0, "Array must be greater than 0");
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum / arr.length;
    }
}
