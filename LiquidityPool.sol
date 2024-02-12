// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquidityPool {
    mapping(address => uint) public balances;

    function deposit(uint _amount) external payable {
        balances[msg.sender] += _amount;
        // Transfer ETH to contract
        payable(address(this)).transfer(msg.value);
    }

    function withdraw(uint _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        balances[msg.sender] -= _amount;
        // Transfer ETH from contract to sender
        payable(msg.sender).transfer(_amount);
    }
}