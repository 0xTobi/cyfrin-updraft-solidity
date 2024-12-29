// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    uint256 constant SEND_VALUE = 0.1 ether;    // 100000000000000000
    uint256 constant STARTING_BALANCE = 10 ether;    // 100000000000000000
    address USER = makeAddr("user");

    // This is run before any other function in the contract.
    function setUp() external {
        // fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, STARTING_BALANCE);
    }

    function testMinDollarIsFive() public view {
        console.log(fundMe.MINIMUM_USD());
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        console.log(fundMe.i_owner()); // This is the address of the contract deployer for FundMe i.e FundMeTest()
        console.log(msg.sender); // This is our address
        console.log(address(this)); // This is the address of this contract.
        assertEq(fundMe.i_owner(), msg.sender);
    }

    function testPriceFeedVersionIsAccurate() public view {
        uint256 version = fundMe.getVersion();
        console.log(version);
        assertEq(version, 4);
    }

    function testFundFailsWithoutEnoughEth() public {
        vm.expectRevert();  // Next line should revert only if it fails.
        fundMe.fund();      // Send 0 Eth (OFC this would fail because its not up to $5)
    }

    function testFundUpdatesFUndedDataStructure() public {
        vm.prank(USER);     // The next tx will be sent by this address
        fundMe.fund{value: SEND_VALUE}();

        uint256 amountFUnded = fundMe.getaddressToAmountFunded(USER);
        assertEq(amountFUnded, SEND_VALUE);
    }
}
