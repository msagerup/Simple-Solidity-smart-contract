// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FoundMe {

    uint256 public minUsd = 50 *1e18; // 1*10  ** 18 ;

    function found() public payable  {
        // I want to be able to set a minimum found amount in USD.
        // 1. How do I send ETH to this contract?

        // This revers if condition is not meet.
        require(getConvertionRate(msg.value) >= minUsd, "You dind't send enough, brokie.."); // 1e18 = 1 * 10 ** 18 = 1000000000000000000 = 1ETH

    }

    function getPrice() public view returns(uint256) {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306 Sepolia testnet
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
         (,int answer,,,) = priceFeed.latestRoundData();
        
        return uint256(answer * 1e10);
    }

    function getConvertionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }
}