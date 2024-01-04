require("@nomiclabs/hardhat-waffle");

module.exports = {
  solidity: "0.8.20",
  networks: {
    sepolia: {
      url: "https://sepolia.infura.io/v3/6c95b833c0ec4e699bb879adcbba6abe",
      accounts: [], 
    },
  },
};
