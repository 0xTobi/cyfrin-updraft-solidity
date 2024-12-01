// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19; 

import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

contract FundMe {

    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 5e18;

    address[] public funders;

    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Didn't send enough ETH");
            // 1e18 = 1 ETH = 1000000000000000000 wei
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }
    
    function withdraw() public onlyOwner {
        // Ensures that only the owner of the wallet can withdraw the fund.
        // require(msg.sender == owner, "Must be owner!");
        
        // WITHDRAW FUNDS
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
        
        // Transfer
        // payable(msg.sender).transfer(address(this).balance);
        
        // Send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");

        // RESET AMOUNT TO ZERO WHEN YOU WITHDRAW
        for (uint256 fundersIndex = 0; fundersIndex < funders.length; fundersIndex++) {
            address funder = funders[fundersIndex];
            addressToAmountFunded[funder] = 0;
        }

        // RESET FUNDERS ARRAY
        funders = new address[](0);
        // delete funders;
    }

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Sender is not owner");
        if(msg.sender != i_owner) {revert NotOwner();}
        _;
    }

    // If someone sends this contract ETH without calling the fund function.

    // Accidentally sends ETH
    receive() external payable  {
        fund();
    }

    // 
    fallback() external payable {
        fund();
    }
}


