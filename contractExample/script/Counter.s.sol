// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        Counter counter =new Counter();
        
        counter.increment();//Counter is 1
        counter.increment();//Counter is 2
        
        counter.setNumber(42); //Counter is 42

        counter.increment();//Counter should be 43 with this
        
        vm.stopBroadcast();
    }
}
