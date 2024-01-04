// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Deployer {
    /*
        This exercise assumes you know how to deploy a contract.
        1. Create an empty contract.
        2. Deploy the contract and return the address in `deployContract` function.
    */
    Empty empty = new Empty();

    function deployContract() public view returns (address) {
        // your code here
        return address(empty);
    }
}

contract Empty {}
