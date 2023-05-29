// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; // Set version.

contract SimpleStorage {
    // bool hasFavoriteNumber = true;
    uint public favoriteNumber = 123;
    // string favoriteNumberinText  = "five";
    // int number = 5;
    // bytes32 favoriteBytes = 'cat';

    // Object, (same as a constructor )
    struct People {
        string name;
        uint favoriteNumber;
    }
    // People public person = People({favoriteNumber: 2, name: "Magnus"});

    People[] public people;


    // calldata, memory, storage
    // calldata = temporary data,immutable
    // memory = temporary data, mutable
    // storage = pemanent data, mutable
    function addPerson (string memory _name, uint _favoriteNumber) public {
        people.push(People(_name, _favoriteNumber));
    }



    function store (uint _favoriteNumber) public  {
        favoriteNumber = _favoriteNumber;
    }

    function read () public view returns(uint256)  {
        return favoriteNumber;
    }
}

