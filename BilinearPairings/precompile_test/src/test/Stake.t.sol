// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import {DSTest} from "ds-test/test.sol";
import {Stake} from "../Stake.sol";
import {MockERC20} from "../Mocks/MockERC20.sol";
import {Utilities} from "./Utils/Utilities.sol";
import {console} from "./Utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

contract StakeContractTest is DSTest {
    Vm internal immutable vm = Vm(HEVM_ADDRESS);

    Stake public stakeContract;
    MockERC20 public mockERC20Contract;
    Utilities internal utils;

    address payable[] internal users;

    function setUp() public {
        stakeContract = new Stake();
        mockERC20Contract = new MockERC20();
        utils = new Utilities();
        users = utils.createUsers(5);
    }

    function test_stake() public {
        address payable alice = users[0];
        vm.label(alice, "Alice");
        vm.prank(alice);
        mockERC20Contract.mint(alice, 10e19);

        uint256 amount = 10e18;
        console.log("Amount : ", amount);
        bool res = mockERC20Contract.approve(address(stakeContract), amount);
        console.log("Approve res : ", res);
        bool stakePassed = stakeContract.stake(amount, address(mockERC20Contract));
        console.log("Stake Passed : ", stakePassed);
        assertTrue(stakePassed);
    }
}