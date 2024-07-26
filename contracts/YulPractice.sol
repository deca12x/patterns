// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// practice passing memory between 2 yul code blocks

contract Add {
    function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
        assembly {
            let result := add(x, y)
            mstore(0x80, result)
            mstore(0x40, add(0x80, 0x20)) // update the free memory pointer
        }

        assembly {
            let result := mload(0x80)
            return(0x80, 32)
        }
    }
}
