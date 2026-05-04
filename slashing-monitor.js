const { ethers } = require("ethers");

/**
 * Monitors AVS events for potential slashing conditions
 */
async function monitorSlashing(avsContract) {
    console.log("Monitoring Actively Validated Services for downtime...");

    avsContract.on("OperatorSlashed", (operator, reason, amount) => {
        console.warn(`
            !!! SLASHING DETECTED !!!
            Operator: ${operator}
            Penalty: ${ethers.formatEther(amount)} ETH
            Reason: ${reason}
        `);
    });
}

module.exports = { monitorSlashing };
