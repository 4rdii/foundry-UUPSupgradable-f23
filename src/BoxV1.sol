// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal number;

    /// @notice cant use cunstrctors with our proxies
    /// @custom:oz-upgrades-unsafa-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() public initializer {
        //initializer modifier makes sure its only initialized once
        __Ownable_init(_msgSender()); // sets owner to: owner = msg.sender
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}
