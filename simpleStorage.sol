// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; // Set version.

contract SimpleStorage {
    // bool hasFavoriteNumber = true;
    uint public favoriteNumber = 123;
    
    // Mapping, (hash table)
    mapping(string => uint) public nameToFavoriteNumber;
    mapping(uint => string) public numberToName;

    // Object, (same as a constructor )
    struct People {
        string name;
        uint favoriteNumber;
    }
    // People public person = People({favoriteNumber: 2, name: "Magnus"});

    // Array 
    People[] public people;


    // calldata, memory, storage
    // calldata = temporary data,immutable
    // memory = temporary data, mutable
    // storage = pemanent data, mutable
    function addPerson (string memory _name, uint _favoriteNumber) public {
        people.push(People(_name, _favoriteNumber));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        numberToName[_favoriteNumber] = _name;
    }

    function store (uint _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    // view and pure fuctions are read only functions and does not cost gass fees.
    function read () public view returns(uint256)  {
        return favoriteNumber;
    }
}
