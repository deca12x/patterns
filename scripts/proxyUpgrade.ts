const { ethers, upgrades } = require("hardhat");
// import { ethers } from 'hardhat';
// write the correct syntax to import ""../src/verifier.sol";
// import { Verifier } from "../src/verifier.sol";

async function main() {
  // DEPLOY VERIFIER CONTRACT
  const verifierFactory = await ethers.getContractFactory("Verifier");
  const verifier = await verifierFactory.deploy();
  const verifierReceipt = await verifier.waitForDeployment();
  const verifierAddress = await verifier.getAddress();
  console.log("Verifier deployed to:", verifierAddress);

  // DEPLOY UPGRADABLE PHARMACY WITH OPENZEPPELIN UPGRADES PLUGIN
  const pharmacyFactory = await ethers.getContractFactory("MedicinePurchase");
  const pharmacy = await upgrades.deployProxy(pharmacyFactory, [
    verifierAddress,
  ]);
  await pharmacy.waitForDeployment();
  const pharmacyAddress = await pharmacy.getAddress();
  console.log("Pharmacy Proxy deployed to:", pharmacyAddress);

  // DEPLOY V2
  const pharmacyFactory2 = await ethers.getContractFactory("MedicinePurchase2");
  const pharmacy2 = await upgrades.upgradeProxy(
    pharmacyAddress,
    pharmacyFactory2
  );
  await pharmacy2.waitForDeployment();
  console.log("Pharmacy upgraded");

  // DEPLOY UUPS PHARMACY (need to tweak it)
  // const pharmacyUUPS = await upgrades.deployProxy(
  //   pharmacyFactory,
  //   [verifierAddress],
  //   { kind: "uups" }
  // );
  // await pharmacyUUPS.waitForDeployment();
  // const pharmacyUUPSAddress = await pharmacyUUPS.getAddress();
  // console.log("Pharmacy UUPS Proxy deployed to:", pharmacyUUPSAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
