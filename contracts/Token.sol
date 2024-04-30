// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

library Balances {

    function move(mapping (address => uint256) storage balances, address from, address to, uint amount) internal {
        require(balances[from] >= amount);
        require(balances[to] + amount >= balances[to]);

        balances[from] -= amount;
        balances[to] += amount;
    }
}


contract Token {

    mapping (address => uint256) public balances;
    using Balances for *;
    mapping (address => mapping (address => uint256)) public allowed;

    event Transfer(address from, address to, uint amount);
    event Approval(address owner, address spender, uint amount);

    constructor() {
        balances[address(0xbD004d9048C9b9e5C4B5109c68dd569A65c47CF9)] = 10;
        balances[address(0x11BdE3126f46Cfb3851a9102c60b510B1305aF5b)] = 5;
    }

    function transfer(address to, uint amount) external returns (bool success) {
        balances.move(msg.sender, to, amount);

        emit Transfer(msg.sender, to, amount);

        return true;
    }

    function transferFrom(address from, address to, uint amount) external returns (bool success) {
        require(allowed[from][msg.sender] >= amount);

        allowed[from][msg.sender] -= amount;
        balances.move(from, to, amount);

        emit Transfer(from, to, amount);

        return true;
    }

    function approve(address spender, uint tokens) external returns (bool success) {
        require(allowed[msg.sender][spender] == 0, "This transaction is not allowed.");

        allowed[msg.sender][spender] = tokens;

        emit Approval(msg.sender, spender, tokens);

        return true;
    }

    function balanceOf(address tokenOwner) external view returns (uint balance) {
        return balances[tokenOwner];
    }
}
