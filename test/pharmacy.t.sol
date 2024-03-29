// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import {MedicinePurchase, IVerifier} from "../src/pharmacy.sol";
import {Verifier, Pairing} from "../src/verifier.sol";

contract TestHelper {
    function sendEther(address payable _to, uint256 _amount) public payable {
        _to.transfer(_amount);
    }
}

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

    function testLogAddresses() public {
        emit log("Pharmacy contract address:");
        emit log_address(address(pharmacy));
        emit log("Verifier contract address:");
        emit log_address(address(verifier));
        emit log("Pharmacy Test address:");
        emit log_address(address(this));
    }

    function testGetPharmacyOwner() public {
        assertEq(pharmacy.owner(), address(this), "ok");
        // assertTrue(pharmacy.owner() == address(this));
    }

    event BuyMedicineA(address indexed buyer);

    function testbuyMedicineA() public {
        IVerifier.Proof memory proof1 = IVerifier.Proof({
            a: IVerifier.G1Point(
                0x27045bd3cf96298d09188bf83231adf5b13236e8002d9d2e864513dada6ab47d,
                0x25f0bfe8e6401d9a0498ecec861a70ba32b11dac1a807722dfa615fe17887e83
            ),
            b: IVerifier.G2Point(
                [
                    0x0059eceab5e351f4e5b2c0a628eda4edef5ede5cdce2a900edde56da881a0fc8,
                    0x16dc8f37ff35b12973538dba8915afa617a4a4d040240ef6ee5abf7aaf0dfe32
                ],
                [
                    0x128d78f20a7b8650fd5e38b6b5a0808a517e5f2b7237f467fd0bcc2d38c69860,
                    0x0e16e2df1a65030bb88fc84e9862b12a0707dd89c7faf73bd928450a07c62c69
                ]
            ),
            c: IVerifier.G1Point(
                0x19b56485bc972765ebd2114539533508c1efca42943b247c584711c208843ec5,
                0x026219f3dc394f6f587cbc1056fe765d7a6bfc64cdadd00e35a9614bab217dcb
            )
        });
        uint256 oneEtherInWei = 1 ether;
        address payable chinghwaAddress = payable(
            0x974BFC05C4B51d4B9d84131A9A870EEcCFB77121
        );
        TestHelper helper = new TestHelper();
        helper.sendEther(chinghwaAddress, oneEtherInWei);
        vm.startPrank(0x974BFC05C4B51d4B9d84131A9A870EEcCFB77121);
        vm.expectEmit(true, true, false, false);
        emit BuyMedicineA(msg.sender);
        pharmacy.buyMedicineA{value: 1e15}(proof1);
        vm.stopPrank();
    }

    // function testSetA() public {
    //     address newOwner = address(verifier);
    //     pharmacy.store(newOwner);
    //     assertTrue(a.retrieve() == 123);
    // }

    // function testFoo(uint256 x) public {
    //     vm.assume(x < type(uint128).max);
    //     assertEq(x + x, x * 2);
    // }
}
