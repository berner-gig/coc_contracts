import { task } from "hardhat/config";

task("deploy_token", "Deploy CoC Token").setAction(async (taskArgs, hre) => {

  const [deployer] = await hre.ethers.getSigners(); 

  console.log("Deploying contracts with the account:", deployer.address);

  const factory = await hre.ethers.getContractFactory("Token");
  const contract = await factory.deploy();

  await contract.waitForDeployment();

  console.log("Contract deployed at:", await contract.getAddress());
});

task("deploy_role", "Deploy CoC Role").setAction(async (taskArgs, hre) => {
  
  const [deployer] = await hre.ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("token_address: ", `${process.env.COC_TOKEN_ADDRESS}`);

  const factory = await hre.ethers.getContractFactory("Role");
  const contract = await hre.upgrades.deployProxy(factory, [`${process.env.COC_TOKEN_ADDRESS}`], { initializer: 'initialize' });

  await contract.waitForDeployment();

  console.log("Contract deployed at:", await contract.getAddress());
});


task("deploy_campaign", "Upgrade CoC Campaign").setAction(async (taskArgs, hre) => {
    
    const [deployer] = await hre.ethers.getSigners(); 
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const factory = await hre.ethers.getContractFactory("Campaign");
    const contract = await hre.upgrades.deployProxy(factory, [], { initializer: 'initialize' });
  
    await contract.waitForDeployment();
  
    console.log("Contract deployed at:", await contract.getAddress());
});


task("deploy_coc", "Deploy Coc").setAction(async (taskArgs, hre) => {
  
  const [deployer] = await hre.ethers.getSigners(); 

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("token_address: ", `${process.env.COC_TOKEN_ADDRESS}`);
  console.log("role_address: ", `${process.env.COC_ROLE_ADDRESS}`);
  console.log("campaign_address: ", `${process.env.COC_CAMPAIGN_ADDRESS}`);

  const factory = await hre.ethers.getContractFactory("ClashOfClef");
  const contract = await hre.upgrades.deployProxy(factory, 
    [`${process.env.COC_TOKEN_ADDRESS}`, `${process.env.COC_ROLE_ADDRESS}`, `${process.env.COC_CAMPAIGN_ADDRESS}`],
    { initializer: 'initialize' });

  await contract.waitForDeployment();

  console.log("Contract deployed at:", await contract.getAddress());
});

