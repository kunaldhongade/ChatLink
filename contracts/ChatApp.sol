// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract ChatApp {
    struct user {
        string name;
        friend[] friendlist;
    }

    struct friend {
        address pubkey;
        string name;
    }

    struct message {
        address sender;
        uint256 timestamp;
        string msg;
    }

    mapping(address => user) userList;
    mapping(bytes32 => message[]) allMessages;

    function checkUserExists(address pubkey) public view returns (bool) {
        return bytes(userList[pubkey].name).length > 0;
    }

    function createAccount(string calldata name) external {
        require(checkUserExists(msg.sender) == false, "user aleady exists");
        require(bytes(name).length > 0, "username cannot be empty");

        userList[msg.sender].name = name;
    }

    function getUsername(address pubkey) external view returns (string memory) {
        require(checkUserExists(pubkey), "user is not registered");

        return userList[pubkey].name;
    }

    function addFriend(address friend_key, string calldata name) external {}
}
