// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;     //  Solidity version, 0.8.18 and above

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function store(uint256 _newNumber) public override {
        myFavouriteNumber = _newNumber + 5;
    }
}