// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor() ERC20("MockERC20", "MERC") {
        _mint(msg.sender, 10000000e18);
    }

    function mint(address _user_address, uint256 _amount) public returns(bool) {
        _mint(_user_address, _amount);
    }
}