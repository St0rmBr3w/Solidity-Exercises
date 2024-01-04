// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract DistributeV2 {
    constructor() payable {}

    function distributeEther(address[] memory addresses) public {
        require(address(this).balance > 0, "Insufficient balance");
        uint256 amount = address(this).balance / addresses.length;

        for (uint i = 0; i < addresses.length; i++) {
            // Attempt to send Ether using call
            (bool sent, ) = addresses[i].call{value: amount}("");
            if (!sent) {
                // Handle the case where the Ether transfer failed
                // You can choose to simply continue, log an event, or implement some other logic
                // For simplicity, this example will just continue to the next address
                continue;
            }
        }
    }
}
