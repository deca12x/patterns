// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SubOverflow {
    function subtract(uint256 x, uint256 y) public pure returns (uint256) {
        assembly {
            let result := mload(0x40) // Load the free memory pointer  
            switch lt(x, y)
            case 1 {
                mstore(result, 0)
            }
            default {
                mstore(result, sub(x, y))
            }
            mstore(0x40, add(result, 32)) // Update the free memory pointer
            return(result, 32)
        }
    }
}
