require("dotenv").config();
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");
require("@openzeppelin/hardhat-upgrades");

module.exports = {
  networks: {
    hardhat: {},
    // mumbai: {
    //   url: process.env.TESTNET_RPC,
    //   accounts: [process.env.PRIVATE_KEY],
    // },
  },
  // etherscan: {
  //   apiKey: process.env.POLYGONSCAN_API_KEY,
  // },
  solidity: {
    version: "0.8.9",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
    },
  },
};
