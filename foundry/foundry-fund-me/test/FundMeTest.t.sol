// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        fundMe = new FundMe();
    }

    function testMinDollarIsFive() public view {
        console.log(fundMe.MINIMUM_USD());
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        console.log(fundMe.i_owner()); // This is the address of the contract deployer for FundMe i.e FundMeTest()
        console.log(msg.sender); // This is our address
        assertEq(fundMe.i_owner(), address(this));
    }

    function testPriceFeedVersion() public {
        console.log(fundMe.getVersion());
        assertEq(fundMe.getVersion(), 4);
    }
}
