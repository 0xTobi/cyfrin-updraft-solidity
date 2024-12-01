// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// import "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    // type visibility name
    // SimpleStorage public mySimpleStorage;
    SimpleStorage[] public listOfSimpleStorageContracts;

    // Creates a new instance of the SimpleStorage contract and pushes it onto the arrary specified.
    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();   // Format: type name = new instance of simpleStorage contract
        listOfSimpleStorageContracts.push(newSimpleStorageContract);    // Here you're pushing the newly created contract address to the LOSSC array
    }

    // Calls the store function of a specified SimpleStorage contract in the array.
    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {

        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // mySimpleStorage.store(_newSimpleStorageNumber);

        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    // Accessing the retrieve function of a specified SimpleStorage contract in the array.
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // return mySimpleStorage.retrieve();

        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
} 