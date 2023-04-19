// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.9;

import "hardhat/console.sol";

contract WavePortal {
    uint256 public waveCount;

    event NewWave(address indexed from, string message, uint256 timestamp);

    struct Wave {
        address waver; // The address of the user who waved.
        string message; // The message the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    Wave[] public waves;
 
    constructor() {
        console.log("_-_-_-_-_-_-_-_-_-_-_-W_A-V_E-P_O-R_T-A_L-_-_-_-_-_-_-_-_-_-_-_");
    }

    function wave(string memory _message) public {
        waveCount += 1;
        console.log("%s waved w/ message %s", msg.sender, _message);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, _message, block.timestamp);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }
}