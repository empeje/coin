import "hardhat-gas-reporter";
import "@nomiclabs/hardhat-waffle";
import "@nomiclabs/hardhat-ethers";

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.7.3",
  networks: {
    hardhat: {
      chainId: 1337
    }
  }
};
