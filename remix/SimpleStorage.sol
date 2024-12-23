// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19; //  Solidity version, 0.8.18 and above

contract SimpleStorage {
    // bool hasFavouriteNumber = true;
    // int256 favouriteInt = -88;
    // string favouriteNumberInText = "Hello"
    // address myAdress = 0x6f451aB7946458550D97a318927381C51870F587
    // bytes32 favouriteBytes32 = "cat"

    // favouriteNumber gets in itialized to 0 if no value is specified.

    // uint256 public myFavouriteNumber;

    uint256 myFavouriteNumber = 0;

    function store(uint256 _favouriteNumber) public virtual {
        myFavouriteNumber = _favouriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myFavouriteNumber;
    }

    // uint256[] listOfFavouriteNumbers;  // Stores an array of uint256 datatypes

    // struct is used to create a new custom type
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // Person[3] public listOfPeople;  // Static array - Max length is 3.
    Person[] public listOfPeople; // Dynamic array - Can grow to any length.

    mapping(string => uint256) public nameToFavoriteNumber;

    // Person public patrick = Person(7, "Patrick"); // The values are assigned respectively, favouriteNumber takes 7, while name takes "pat".
    // Person public patrick = Person({name: "Patrick", favouriteNumber: 7});  // Assigned explicitly.
    // Person public mariah = Person({name: "Mariah", favouriteNumber: 23});
    // Person public john = Person({name: "John", favouriteNumber: 16});

    // calldata, memory, storage
    // calldata & memory means this function is temporary and is only going to be available for the duration of the function in which they were called.
    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfPeople.push(Person(_favouriteNumber, _name));
        nameToFavoriteNumber[_name] = _favouriteNumber;
    }
}

contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}
