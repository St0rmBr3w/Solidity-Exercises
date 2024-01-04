// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract CodeSize {
    /**
     * The challenge is to create a contract whose runtime code (bytecode) size is greater than 1kb but less than 4kb
     */
    address public owner;

    constructor() {
        owner = msg.sender; // Set the contract creator as the owner
    }

    // Modifier that checks the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _; // This is where the function body is inserted
    }

    // Example function using the modifier
    function changeOwner(address newOwner) public onlyOwner {
        owner = newOwner;
    }

    // Another example function that can be called by anyone
    function sayHello() public pure returns (string memory) {
        return "Hello!";
    }

}
