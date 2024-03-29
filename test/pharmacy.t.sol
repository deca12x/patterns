// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import {MedicinePurchase} from "../src/pharmacy.sol";
import {Verifier} from "../src/verifier.sol";

contract PharmacyTest is Test {
    // Variable for contract instance
    MedicinePurchase private pharmacy;
    Verifier internal verifier;
    address internal deployer;

    function setUp() public {
        deployer = msg.sender;
        verifier = new Verifier();
        pharmacy = new MedicinePurchase(address(verifier));
    }

    function testBar() public {
        assertEq(uint256(1), uint256(1), "ok");
    }

    // function testFoo(uint256 x) public {
    //     vm.assume(x < type(uint128).max);
    //     assertEq(x + x, x * 2);
    // }

    function test_Log() public {
        emit log("here");
        emit log_address(address(this));
    }

    function test_GetValue() public {
        assertTrue(pharmacy.owner() == address(this));
    }

    // function test_SetValue() public {
    //     uint256 x = 123;
    //     a.store(x);
    //     assertTrue(a.retrieve() == 123);
    // }
}
