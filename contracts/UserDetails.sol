// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract UserDetails {

    struct User {
        string _name;
        string _surname;
        address _addr;
        uint _age;
    }

    uint256 public registeredUsers;

    mapping (address => User) private users;
    mapping (address => bool) public isRegistered;

    event UserRegistered(address addr);

    event UserModified(address addr);

    event UserDeleted(address addr);

    function getDetails() public view returns (User memory) {
        require(isRegistered[msg.sender], "User doesn't exist");

        User memory user = users[msg.sender];
        return user;
    }

    function register(string memory name, string memory surname, uint age) public {
        require(!isRegistered[msg.sender], "Already registered");

        User memory user = User(name, surname, msg.sender, age);
        users[msg.sender] = user;
        isRegistered[msg.sender] = true;

        registeredUsers++;
        emit UserRegistered(msg.sender);
    }

    function modify(string memory name, string memory surname, uint age) public {
        require(isRegistered[msg.sender], "User doesn't exist");

        users[msg.sender]._name = name;
        users[msg.sender]._surname = surname;
        users[msg.sender]._age = age;

        emit UserModified(msg.sender);
    }

    function unregister(address _addr) public {
        require(isRegistered[msg.sender], "User doesn't exist");

        delete (users[_addr]);
        isRegistered[msg.sender] = false;

        registeredUsers--;
        emit UserDeleted(_addr);
    }
}
