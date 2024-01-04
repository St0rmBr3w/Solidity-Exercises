// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract IdiotBettingGame {
    /*
        This exercise assumes you know how block.timestamp works.
        - Whoever deposits the most ether into a contract wins all the ether if no-one 
          else deposits after an hour.
        1. `bet` function allows users to deposit ether into the contract. 
           If the deposit is higher than the previous highest deposit, the endTime is 
           updated by current time + 1 hour, the highest deposit and winner are updated.
        2. `claimPrize` function can only be called by the winner after the betting 
           period has ended. It transfers the entire balance of the contract to the winner.
    */
    address public currentLeader;
    uint256 public highestBet;
    uint256 public endOfBetting;

    constructor() {
        currentLeader = address(0);
        highestBet = 0;
        endOfBetting = block.timestamp;
    }

    function bet() public payable {
        // your code here
        require(msg.value > highestBet, "Bet must be higher than the current highest bet");
        currentLeader = msg.sender;
        highestBet = msg.value;
        endOfBetting = block.timestamp + 1 hours;
    }

    function claimPrize() public {
        // your code here
        require(msg.sender == currentLeader, "Only the current leader can claim the prize");
        require(block.timestamp >= endOfBetting, "Betting period has not ended yet");
        require(address(this).balance > 0, "No funds to claim");

        uint256 prizeAmount = address(this).balance;
        (bool sent, ) = currentLeader.call{value: prizeAmount}("");
        require(sent, "Failed to send Ether");

        // Resetting the game state
        currentLeader = address(0);
        highestBet = 0;
        endOfBetting = block.timestamp;
    }

    // Allow contract to receive Ether
    receive() external payable {}
}
