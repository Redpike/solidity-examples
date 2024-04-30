import {ethers} from 'hardhat';

async function main(): Promise<void> {
    const contractFactory = await ethers.getContractFactory('Token');
    const contract = await contractFactory.deploy();

    await contract.waitForDeployment();

    console.log(`Deployed to ${contract.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exitCode = 0)
    .catch((error) => {
        console.error(error);
        process.exitCode = 1;
    });
