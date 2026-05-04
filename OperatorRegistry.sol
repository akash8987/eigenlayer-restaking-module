// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OperatorRegistry {
    struct Operator {
        bool isActive;
        string metadataURI;
        uint256 commissionRate;
    }

    mapping(address => Operator) public operators;
    mapping(address => address) public stakerToOperator;

    event OperatorRegistered(address indexed operator, string metadataURI);
    event StakerDelegated(address indexed staker, address indexed operator);

    function registerOperator(string calldata _metadata, uint256 _commission) external {
        operators[msg.sender] = Operator(true, _metadata, _commission);
        emit OperatorRegistered(msg.sender, _metadata);
    }

    function delegateTo(address _operator) external {
        require(operators[_operator].isActive, "Operator not active");
        stakerToOperator[msg.sender] = _operator;
        emit StakerDelegated(msg.sender, _operator);
    }
}
