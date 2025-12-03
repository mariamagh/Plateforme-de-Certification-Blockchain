require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

// --- CORRECTION DE SÉCURITÉ POUR DOCKER ---
// Si les clés n'existent pas (pendant le build Docker), on utilise des valeurs bidons.
// Cela permet à "npx hardhat compile" de fonctionner sans planter.
const INFURA_API_KEY = process.env.INFURA_API_KEY || "";
const PRIVATE_KEY = process.env.PRIVATE_KEY || "0x0000000000000000000000000000000000000000000000000000000000000000";

module.exports = {
  solidity: "0.8.27",
  networks: {
    amoy: {
      url: "https://polygon-amoy.infura.io/v3/" + INFURA_API_KEY,
      accounts: [PRIVATE_KEY],
    },
  },
};