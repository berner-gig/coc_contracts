import * as dotenv from "dotenv";

import { HardhatUserConfig } from "hardhat/config";
import "@nomiclabs/hardhat-ethers";
import "hardhat-abi-exporter";
import "@openzeppelin/hardhat-upgrades";

import "./tasks/clash_of_clef";

dotenv.config();

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    localhost: {
      url: "http://localhost:8545",
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    },
    bsc_testnet: {
      url: "https://bsc-testnet.bnbchain.org",
      accounts: [`0x${process.env.PRIVATE_KEY}`],
    },
  },
};

export default config;
