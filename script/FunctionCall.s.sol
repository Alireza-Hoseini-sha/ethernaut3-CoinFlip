// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Script} from "forge-std/Script.sol";
import "../src/Attack.sol";

contract FunctionCall is Script {
    Attack public attack;
    address public attackContractAddress = 0x4b6Cb2C6C2a45b6DBFFe396593986b036746e942;
    function run() external {
        attack = Attack(attackContractAddress);
        vm.startBroadcast();
        attack.guessFlip();
        vm.stopBroadcast();
    }
}