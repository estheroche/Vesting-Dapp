// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/OrganizationFactory.sol";
import {EgoToken} from "../src/EgoToken.sol";

contract OrganizationScript is Script {
    OrganizationFactory _OrganizationFactory;
    EgoToken _EgoToken;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        _OrganizationFactory = new OrganizationFactory();
        _EgoToken = new EgoToken();
        _OrganizationFactory.createOrganization(
            "Ego Vest Token",
            "ego",
            100000 * 10 ** 18,
            address(_EgoToken)
        );
        vm.stopBroadcast();
    }
}
