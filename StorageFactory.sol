// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray;
    function createSimpleStorageContact () public {
        // Generates a new contact.
        SimpleStorage simpleStorage = new SimpleStorage();
        // Saves contacts in array.
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore (uint256 _simpleStorageIndex, uint256 _simpleStorageNumber ) public {
        // Call functions on imported contract.

        // We always need 
        // Address and ABI - Application Binary interface.
        // SimpleStorage simpleStorage !! This a new variable with the TYPE of SimpleStorage.
        
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // simpleStorage.store(_simpleStorageNumber);

        // Refactor, same as above.
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return simpleStorage.read();

        // Refactor, same as above.
        return simpleStorageArray[_simpleStorageIndex].read();
    }
}