// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DataMapping {
    event newData(uint id,uint data);

    uint256 public nextId;

    mapping(uint => uint) public idToData;

    function addData(uint data) public {
        
        idToData[nextId]=data;

        emit newData(nextId,data);
        nextId++;
    }
}
