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

    constructor() {}
}
