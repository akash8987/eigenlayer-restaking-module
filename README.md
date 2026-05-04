# EigenLayer Restaking Module

This repository provides an expert-level blueprint for a Restaking integration. It allows users to take their Liquid Staking Tokens (LSTs) and opt-in to secure additional decentralized modules, earning extra yield in exchange for additional slashing risks.

### Core Concepts
* **Strategy Manager:** Handles the accounting of various LSTs (stETH, rETH, etc.) within the protocol.
* **Delegation:** Users can delegate their restaked power to Operators who run the off-chain software for AVSs.
* **Slashing Logic:** Implements the hooks necessary for AVSs to penalize malicious or negligent operators.

### Workflow
1. **Deposit:** User deposits an approved LST into the `RestakeVault`.
2. **Delegation:** User chooses an Operator to manage their stake.
3. **AVS Enrollment:** The stake is used to provide security for a specific service (e.g., a data availability layer).
4. **Withdrawal:** Users must observe a cooldown period (e.g., 7 days) to ensure no pending slashing exists.
