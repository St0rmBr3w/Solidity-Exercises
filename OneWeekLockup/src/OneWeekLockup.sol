// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */

    struct UserInfo {
        uint256 balance;
        uint256 lastDepositTime;
    }

    // Mapping from user address to their info
    mapping(address => UserInfo) private userInfos;

    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return userInfos[user].balance;
    }

    function depositEther() external payable {
        /// add code here
        require(msg.value > 0, "Deposit value must be greater than 0");
        UserInfo storage userInfo = userInfos[msg.sender];
        userInfo.balance += msg.value;
        userInfo.lastDepositTime = block.timestamp;

    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        UserInfo storage userInfo = userInfos[msg.sender];
        require(block.timestamp >= userInfo.lastDepositTime + 1 weeks, "Withdrawal locked for 1 week");
        require(amount <= userInfo.balance, "Insufficient balance");
        userInfo.balance -= amount;
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    // Allow contract to receive Ether
    receive() external payable {}
}
