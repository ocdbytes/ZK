// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error TransferFailed();

/**
 * @author ocdbytes
 * @dev Simple Staking contract
 */
contract Stake {
    mapping(address => mapping(address => uint256)) public s_balances;
    /**
     * @dev Function to stake the tokens
     * @param _amount amount of tokens to stake
     * @param _token address of the token that needs to be staked
     */
    function stake(uint256 _amount, address _token) external returns(bool) {
        bool success = IERC20(_token).transferFrom(msg.sender, address(this), _amount);
        if(!success) revert TransferFailed();
        s_balances[msg.sender][_token] += _amount;
        return success;
    }
}