const hre = require("hardhat");

async function main() {
  // 1. On prépare le contrat
  const StudentRegistry = await hre.ethers.getContractFactory("StudentRegistry");

  console.log("Déploiement en cours... ⏳");

  // 2. On envoie la transaction de déploiement
  const studentRegistry = await StudentRegistry.deploy();

  // 3. On attend que le réseau confirme (minage du bloc)
  await studentRegistry.waitForDeployment();

  // 4. On récupère l'adresse finale
  console.log("StudentRegistry déployé à l'adresse :", await studentRegistry.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});