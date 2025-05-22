// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract Cap {
    struct UserData {
        uint256 balance;
        bool migrated;
        address eth_address;
    }
    mapping(address => UserData) public users;

    modifier onlyOwner() {
        require(msg.sender == address(this));
        _;
    }

    function add(UserData calldata user) public onlyOwner {}

    function remove(address user) public onlyOwner {}

    function migrate(address user) public onlyOwner {}
}
