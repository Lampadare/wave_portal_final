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

    Wave [] public waves;

    uint256 private seed;
 
    constructor() payable {
        console.log("_-_-_-_-_-_-_-_-_-_-_-W_A-V_E-P_O-R_T-A_L-_-_-_-_-_-_-_-_-_-_-_");
        seed = uint256(block.timestamp + block.difficulty);
    }

    function wave(string memory _message) public payable {
        waveCount += 1;

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, _message, block.timestamp);

        seed = uint256(block.timestamp + block.difficulty + seed)%100;

        if (seed <= 3) {
            uint256 prize = 0.0001 ether;
            require(prize <= address(this).balance, "Trying to withdraw more money than the contract has.");
            (bool success, ) = (msg.sender).call{value: prize}("You won!");
            require(success, "Failed to withdraw money from contract.");
        }
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    receive() external payable {}

    fallback() external payable {}
}