// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RestakeVault is ReentrancyGuard, Ownable {
    mapping(address => mapping(address => uint256)) public stakerStrategyShares;
    mapping(address => uint256) public totalStrategyShares;

    event Deposit(address indexed staker, address token, uint256 shares);
    event WithdrawalInitiated(address indexed staker, uint256 shares);

    constructor() Ownable(msg.sender) {}

    function deposit(address token, uint256 amount) external nonReentrant {
        IERC20(token).transferFrom(msg.sender, address(this), amount);
        
        // In a real implementation, shares are calculated via Strategy contracts
        uint256 shares = amount; 
        
        stakerStrategyShares[msg.sender][token] += shares;
        totalStrategyShares[token] += shares;

        emit Deposit(msg.sender, token, shares);
    }

    function getShares(address staker, address token) external view returns (uint256) {
        return stakerStrategyShares[staker][token];
    }
}
