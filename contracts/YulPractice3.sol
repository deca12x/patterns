// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Scope {
    uint256 public count = 10;

    function increment(uint256 num) public {
        assembly {
          let prev := sload(count.slot)
          let new := add(prev, num)
          sstore(count.slot, new)
        }
    }
}
