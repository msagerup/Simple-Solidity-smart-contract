// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FoundMe {
    using PriceConverter for uint256;

    uint256 public constant MINUSD = 50 *1e18; // 1*10  ** 18 ;
    address[] public founders;
    mapping(address => uint256) public addressToAmountFounded;

    address public immutable i_owner;

    constructor() {
        // Contructor runs as the fist function when creating a contract. 
        // This ensure that we are set as the owner. (whom ever deploys the contract)
        i_owner = msg.sender;
    }

    function found() public payable  {
        // When using a library, the first values before the method is the first param. so here, msg.value is the param for getConvertionRate function.
        require(msg.value.getConvertionRate() >= MINUSD, "You dind't send enough, brokie.."); // 1e18 = 1 * 10 ** 18 = 1000000000000000000 = 1ETH
        founders.push(msg.sender);
        addressToAmountFounded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {

        // For loop
        for(uint256 founderIndex = 0; founderIndex < founders.length; founderIndex++){
            address founder = founders[founderIndex];
            addressToAmountFounded[founder] = 0;
        }
        // reset the array
        founders = new address[](0);
        // withdraw founds 
        // 3 ways to do this. 

        //Transfer:  capped at 2300 gas, if exceeded throws error
        // change type, typecast from address to payable address type
        payable(msg.sender).transfer(address(this).balance);
        // Send:  capped at 2300 gas, returns boolean
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Payment failed, (send)");
        // Call: capped at 2300 gas, returns boolean, returns 2 variables.
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Payment failed, (call)");
    }

    modifier onlyOwner {
     require(msg.sender == i_owner, "Only owner can withdraw");
     _;
    }

    // Fallbacks.
     
    receive() external payable {
       found();
    }

    fallback() external payable {
        found();
    }
}
