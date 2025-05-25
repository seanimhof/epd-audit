// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/Audit.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        Audit audit = new Audit();
        console.log("Audit deployed at:", address(audit));

        vm.stopBroadcast();
    }
}
