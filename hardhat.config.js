require("@nomiclabs/hardhat-waffle");

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
    const accounts = await hre.ethers.getSigners();

    for (const account of accounts) {
        console.log(account.address);
    }
});

module.exports = {
    settings: {
        version: "0.8.0",
        optimizer: {
            enabled: true, runs: 200
        }
    },
    mocha: {
        timeout: 40000
    }
};
