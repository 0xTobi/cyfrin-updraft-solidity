// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 myFavouriteNumber = 0;

    function store(uint256 _favouriteNumber) public virtual {
        myFavouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavouriteNumber;
    }

    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavoriteNumber[_name] = _favouriteNumber;
    }
}
