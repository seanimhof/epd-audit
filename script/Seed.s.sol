// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/Audit.sol";

contract Seed is Script {
    struct SampleAudit {
        string accessorId;
        string epdId;
        string accessType;
    }

    SampleAudit[] data;

    constructor() {
        init();
    }

    function run() external {
        vm.startBroadcast();

        Audit audit = Audit(vm.envAddress("CONTRACT_ADDRESS"));

        for (uint256 i = 0; i < data.length; i++) {
            audit.addAuditLog(data[i].accessorId, data[i].epdId, data[i].accessType);
        }

        console.log("Seeding complete. Audit CA:", address(audit));

        vm.stopBroadcast();
    }

    function init() internal {
        data.push(SampleAudit({accessorId: "1234", epdId: "1111", accessType: "write"}));

        data.push(SampleAudit({accessorId: "9876", epdId: "5555", accessType: "read"}));

        data.push(SampleAudit({accessorId: "2486", epdId: "4466", accessType: "write"}));
    }
}
