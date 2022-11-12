// scripts/deploy_upgradeable_adminbox.js
const { ethers, upgrades } = require("hardhat");

async function main() {
  const AdminBox = await ethers.getContractFactory("AdminBox");
  console.log("Deploying AdminBox...");
  const adminBox = await upgrades.deployProxy(
    AdminBox,
    ["0x9fe46736679d2d9a65f0992f2272de9f3c7fa6e0"],
    { initializer: "initialize" }
  );
  await adminBox.deployed();
  console.log("AdminBox deployed to:", adminBox.address);
}

main();
