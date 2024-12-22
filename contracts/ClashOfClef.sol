//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "./Token.sol";
import "./Role.sol";
import "./Campaign.sol";

contract ClashOfClef is Initializable, OwnableUpgradeable {
    address private _tokenContract;
    address private _roleContract;
    address private _campaignContract;

    function initialize(
        address tokenContract,
        address roleContract,
        address campaignContract
    ) public initializer {
        __Ownable_init(msg.sender);
        _tokenContract = tokenContract;
        _roleContract = roleContract;
        _campaignContract = campaignContract;
    }

    function mint_role(string memory tokenURI) external {
        Role(_roleContract).mint(msg.sender, tokenURI);
    }

    function report_competition(uint64 relationId, bytes32 digests) external onlyOwner {
        Campaign(_campaignContract).sync_competition_result(relationId, digests);
    }
}