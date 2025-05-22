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

    function add(
        address user,
        uint256 balance,
        address eth_address
    ) public onlyOwner {
        require(user != address(0), "Invalid address");
        require(eth_address != address(0), "Invalid address");
        require(user != eth_address, "Addresses cannot be the same");
        require(balance > 0, "Balance must be greater than 0");

        users[user] = UserData(balance, false, eth_address);
    }

    function remove(address user) public onlyOwner {
        require(users[user].migrated == false, "Cannot remove migrated user");

        delete users[user];
    }

    function migrate(address user) public onlyOwner {
        require(users[user].migrated == false, "User has already migrated");

        users[user].migrated = true;
    }
}
