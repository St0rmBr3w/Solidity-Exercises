// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Divide {
    uint256 public constant PERCENTAGE_INTEREST = 3;

    /**
     * The calculate interest function is buggy because of how it calculates interest of amount parsed into it
     * Make it return the right value.
     * Still doesn't solve potential edge cases where "x" is less than 1.
     */

    function calculateInterest(uint256 amount) external pure returns (uint256) {
        uint256 x = (amount * PERCENTAGE_INTEREST / 100);
        return x;
    }
}
