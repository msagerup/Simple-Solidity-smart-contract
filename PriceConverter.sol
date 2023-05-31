// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
     function getPrice() internal view returns(uint256) {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306 Sepolia testnet
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
         (,int answer,,,) = priceFeed.latestRoundData();
        
        return uint256(answer * 1e10);
    }

    function getConvertionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }
}