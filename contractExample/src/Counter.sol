// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    event Increment();
    event SetNumber(uint number);   

    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
        emit SetNumber(number);
    }

    

    function increment() public {
        number++;
        emit Increment();
    }
}
