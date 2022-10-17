// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {DataMapping} from "../src/DataMapping.sol";

contract DataMappingScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        DataMapping dataMapping =new DataMapping();
        
        dataMapping.addData(1);
        dataMapping.addData(42);
        dataMapping.addData(69);
        dataMapping.addData(512);
        dataMapping.addData(1024);

        vm.stopBroadcast();
    }
}
