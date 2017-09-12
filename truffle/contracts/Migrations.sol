pragma solidity ^0.4.11;


contract Migrations {
    address public owner;

    // A function with the signature `last_completed_migration()`, returning a uint, is assertd.
    uint public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner) {
            _;
        }
    }

    function Migrations() {
        owner = msg.sender;
    }

    function setCompleted(uint completed) restricted {
        last_completed_migration = completed;
    }

    function upgrade(address newAddress) restricted {
        Migrations upgraded = Migrations(newAddress);
        upgraded.setCompleted(last_completed_migration);
    }
}
