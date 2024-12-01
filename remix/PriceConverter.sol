// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19; 

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getVersion() internal view returns(uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    // Returns the value of ETH in terms of USD
    function getPrice() internal  view returns(uint256) {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI ✅
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData(); 
            // Price of ETH in USD - int256 because some price could be negative.
            // 3192.00000000 - 8 Decimals
        return uint256(answer * 1e10);
            // mathces the decimal of msg.value
    }

    // Convert msg.value to USD using getPrice
    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
            // Both ethPrice and ethAmount are in 1e18, multiplying them will give 1e36, so you have to cut that down to 1e18 back.
        return ethAmountInUsd;
            // Note: Price in usd is still having 1e18 decimals.
    }

}