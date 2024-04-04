const { ethers, upgrades } = require("hardhat");
// import { ethers } from 'hardhat';
// write the correct syntax to import ""../src/verifier.sol";
// import { Verifier } from "../src/verifier.sol";

async function main() {
  const signers = await ethers.getSigners();
  const firstSignerAddress: string = signers[0].address;

  const verifierFactory = await ethers.getContractFactory("Verifier");
  const verifier = await verifierFactory.deploy();
  const verifierReceipt = await verifier.waitForDeployment();
  const verifierAddress = await verifier.getAddress();
  console.log("Verifier deployed to:", verifierAddress);

  const pharmacyFactory = await ethers.getContractFactory("MedicinePurchase");
  const pharmacy = await upgrades.deployProxy(pharmacyFactory, [
    verifierAddress,
  ]);
  await pharmacy.waitForDeployment();
  console.log(
    "Pharmacy implementation deployed to:",
    await pharmacy.getAddress()
  );
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
