// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import {Verifier} from "../src/verifier.sol";

contract PharmacyTest is Test {
    // Variable for contract instance
    Verifier private verifier;
    address internal deployer;
    ErrorsTest test;

    function setUp() public {
        deployer = msg.sender;
        verifier = new Verifier();
    }

    function testLogAddresses() public {
        emit log("Verifier contract address:");
        emit log_address(address(verifier));
        emit log("Verifier Test address:");
        emit log_address(address(this));
    }

    function testGetPharmacyOwner() public {
        // assertEq(verifier.verifyTx(myBool, myInput), 1, "ok");
    }

    // function testExpectArithmetic() public {
    //     vm.expectRevert(stdError.arithmeticError);
    //     test.arithmeticError(10);
    // }
}

contract ErrorsTest {
    function arithmeticError(uint256 a) public {
        uint256 a = a - 100;
    }
}
