//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

event SyncCompetitionResult(uint64 relationId, uint256 competitionId);

contract Campaign is Initializable, OwnableUpgradeable {

    uint256 private _nextCompetitionId;

    mapping (uint256 competitionId => bytes32) _competitions;

    function initialize() public initializer {
        __Ownable_init(msg.sender);
        _nextCompetitionId = 0;
    }

    function sync_competition_result(uint64 relationId, bytes32 digests) public {
        uint256 competitionId = _nextCompetitionId++;
        _competitions[competitionId] = digests;

        emit SyncCompetitionResult(relationId, competitionId);
    }
}