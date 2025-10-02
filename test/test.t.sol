// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import "../src/Attack.sol";
import "../src/CoinFlip.sol";

contract test is Test {
    CoinFlip public coinFlip;
    Attack public attack;
    function setUp() external {
        coinFlip = new CoinFlip();
        attack = new Attack(address(coinFlip));
    }

    function testGuessFlip() public {
        for(uint8 i=1; i<= 10; i++) {
            attack.guessFlip();
        }
        require(coinFlip.consecutiveWins() == 10, "consecutiveWins should be 10");
    }
}