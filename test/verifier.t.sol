// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import {Verifier, Pairing} from "../src/verifier.sol";

contract PharmacyTest is Test {
    // Variable for contract instance
    Verifier private verifier;
    address internal deployer;
    Verifier.Proof internal proof;

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

    function testVerifyTx() public {
        Verifier.Proof memory proof1 = Verifier.Proof({
            a: Pairing.G1Point(
                0x27045bd3cf96298d09188bf83231adf5b13236e8002d9d2e864513dada6ab47d,
                0x25f0bfe8e6401d9a0498ecec861a70ba32b11dac1a807722dfa615fe17887e83
            ),
            b: Pairing.G2Point(
                [
                    0x0059eceab5e351f4e5b2c0a628eda4edef5ede5cdce2a900edde56da881a0fc8,
                    0x16dc8f37ff35b12973538dba8915afa617a4a4d040240ef6ee5abf7aaf0dfe32
                ],
                [
                    0x128d78f20a7b8650fd5e38b6b5a0808a517e5f2b7237f467fd0bcc2d38c69860,
                    0x0e16e2df1a65030bb88fc84e9862b12a0707dd89c7faf73bd928450a07c62c69
                ]
            ),
            c: Pairing.G1Point(
                0x19b56485bc972765ebd2114539533508c1efca42943b247c584711c208843ec5,
                0x026219f3dc394f6f587cbc1056fe765d7a6bfc64cdadd00e35a9614bab217dcb
            )
        });
        uint[2] memory input1 = [
            uint(uint160(0x974BFC05C4B51d4B9d84131A9A870EEcCFB77121)),
            1234
        ];

        Verifier.Proof memory proof2 = Verifier.Proof({
            a: Pairing.G1Point(
                0x2280f21d84c13bfb08878d7a57c83fe6cef1e889ddd3c6d2f735b85089c60f6d,
                0x0caee1e6b14d8083d0235691a5691ebea83a8ca7192fce03cc7232b6c1a8b46c
            ),
            b: Pairing.G2Point(
                [
                    0x167f034a3eedb5f7e9d0ba82f28214d28db8c8d48e4ed0ec65fa98dadc9497c3,
                    0x268d6e09802b324a3362597e4c95b840e92f459c1a8fe5e94b174da1406bbd65
                ],
                [
                    0x02a5950e4a19d50b5a204be8c6cf18a9a9231b9b9ddc8cdd9a55574b27cf1487,
                    0x2c4a32b08e951b15a2c0c210c8e35f2296aebd298fb62e5a1c2da62dd210502a
                ]
            ),
            c: Pairing.G1Point(
                0x0890362478dc373f58e9f1760b9ec9841c6065a88e0141b4a792c753e39d9ede,
                0x166d6f96145c8b3fb23742bc4b67b54e345b74391b61b29d2d7bc5381b0da7d6
            )
        });
        uint[2] memory input2 = [
            uint(uint160(0x7d77b0d031B4B8C0444eaE9b778479bbFcd6721a)),
            5678
        ];

        Verifier.Proof memory proof3 = Verifier.Proof({
            a: Pairing.G1Point(
                0x028195c34e9134e151da7e8f5e8e6f72ef3481ef13d9020da3680db9d877ba57,
                0x061aba800eca508650d0c15a1b4553bb9a12cfb1e72632eadfba0e2a8cbfff2a
            ),
            b: Pairing.G2Point(
                [
                    0x1ee8688e3b35d9618dba7322577e3561aa9eca1a9e6e358daf85e9ca51bec41c,
                    0x0fef8bda9453610afcf1d27ce8e87f4d40cba40cd7da7270e41ad3f1883e4780
                ],
                [
                    0x2e82664278fbd161f4b1c874a3055bade74d45367f98c916921cd68b43bced6e,
                    0x26d8776468a53ccf2b04b7301edd121cec896e6d0ddf857201e96b849ed0171e
                ]
            ),
            c: Pairing.G1Point(
                0x2c198321be1bcfd3a916a8360b73841aa5fb6e8a47758632deac22a66a21cfdb,
                0x2b2bc53f9dd2df776c96f2de8eeafe13d32309c06e8abc2cfd8daa26d2dc6b65
            )
        });
        uint[2] memory input3 = [
            uint(uint160(0x861d05cbFB81319f99a62B04CD253E31112ced5D)),
            1234
        ];

        assertTrue(verifier.verifyTx(proof1, input1));
        assertTrue(verifier.verifyTx(proof2, input2));
        assertTrue(verifier.verifyTx(proof3, input3));

        assertTrue(!verifier.verifyTx(proof1, input2));
        assertTrue(!verifier.verifyTx(proof2, input3));
        assertTrue(!verifier.verifyTx(proof3, input1));
    }
}
