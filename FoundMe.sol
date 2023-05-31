// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FoundMe {
    using PriceConverter for uint256;

    uint256 public minUsd = 50 *1e18; // 1*10  ** 18 ;
    address[] public founders;
    mapping(address => uint256) public addressToAmountFounded;

    function found() public payable  {
        // When using a library, the first values before the method is the first param. so here, msg.value is the param for getConvertionRate function.
        require(msg.value.getConvertionRate() >= minUsd, "You dind't send enough, brokie.."); // 1e18 = 1 * 10 ** 18 = 1000000000000000000 = 1ETH
        founders.push(msg.sender);
        addressToAmountFounded[msg.sender] = msg.value;
    }

    function withdraw() public {
        // For loop
        for(uint256 founderIndex = 0; founderIndex < founders.length; founderIndex++){
            address founder = founders[founderIndex];
            addressToAmountFounded[founder] = 0;
        }
    }

}

https://youtu.be/gyMwXuJrbJQ?t=16829