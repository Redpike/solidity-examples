// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract UserDetails {

    struct User {
        string name;
        string surname;
        address addr;
        uint age;
    }

    uint256 public registeredUsers;

    mapping (address => User) private users;
    mapping (address => bool) public isRegistered;

    event UserRegistered(address addr);

    event UserModified(address addr);

    event UserDeleted(address addr);

    function getUsers() public view returns(User[] memory) {
        User[] memory result = new User[](registeredUsers);
        uint256 i = 0;
        for (address addr in users) {
            result[i] = users[addr];
            i++;
        }
        return result;
    }

    function register(string name, string surname, uint age) public {
        require(!isRegistered[msg.sender], "Already registered");

        User user = User(name, surname, msg.sender, age);
        users[msg.sender] = user;
        isRegistered[msg.sender] = true;

        registeredUsers++;
        emit UserRegistered(msg.sender);
    }

    function modify(string name, string surname, uint age) public {
        require(isRegistered[msg.sender], "User doesn't exist");

        users[msg.sender].name = name;
        users[msg.sender].surname = surname;
        users[msg.sender].age = age;

        emit UserModified(msg.sender);
    }

    function unregister(address addr) public {
        require(isRegistered[msg.sender], "User doesn't exist");

        delete (users[addr]);
        isRegistered[msg.sender] = false;

        registeredUsers--;
        emit UserDeleted(addr);
    }
}
