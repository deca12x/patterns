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
    ErrorsTest test;

    function setUp() public {
        deployer = msg.sender;
        verifier = new Verifier();
        pharmacy = new MedicinePurchase(address(verifier));
        test = new ErrorsTest();
    }

    function logAddresses() public {
        emit log("Pharmacy contract address:");
        emit log_address(address(this));
        emit log("Verifier contract address:");
        emit log_address(address(verifier));
        emit log("Pharmacy Test address:");
        emit log_address(address(this));
    }

    function testGetPharmacyOwner() public {
        assertEq(pharmacy.owner(), address(this), "ok");
        // assertTrue(pharmacy.owner() == address(this));
    }

    // function testSetA() public {
    //     address newOwner = address(verifier);
    //     pharmacy.store(newOwner);
    //     assertTrue(a.retrieve() == 123);
    // }

    // function testExpectArithmetic() public {
    //     vm.expectRevert(stdError.arithmeticError);
    //     test.arithmeticError(10);
    // }

    // assertTrue(...condition);

    // function testFoo(uint256 x) public {
    //     vm.assume(x < type(uint128).max);
    //     assertEq(x + x, x * 2);
    // }
}

contract ErrorsTest {
    function arithmeticError(uint256 a) public {
        uint256 a = a - 100;
    }
}
