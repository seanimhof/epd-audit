// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

import {Script, console} from "forge-std/Script.sol";
import {Audit} from "../src/Audit.sol";

contract AuditScript is Script {
    Audit public audit;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        audit = new Audit();

        vm.stopBroadcast();
    }
}
