// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    string[999] ourwaves;

    constructor() {
        console.log("_-_-_-_-_-_-_-_-_-_-_-W_A-V_E-P_O-R_T-A_L-_-_-_-_-_-_-_-_-_-_-_");
    }

    function wave(string memory wave_note) public {
        totalWaves += 1;
        ourwaves[totalWaves] = wave_note;
        console.log("%s has waved with this message: %s !", msg.sender, wave_note);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function printTotalWaves() public view returns (string[999] memory) {
        for (uint i = 1; i <= totalWaves; i++) {
            console.log("Wave number %d is %s ", i, ourwaves[i]);
        }
        return ourwaves;
    }
}