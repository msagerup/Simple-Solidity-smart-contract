// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";


//Inherit contract

contract ExtraStorage is SimpleStorage {

        // This contract is the same as  SimpleStorage
        // we need to override the function, in the parrent contract we need to add virutal

        function store(uint256 _favoriteNumber) public override  {
            favoriteNumber = _favoriteNumber + 5;
        }
}
