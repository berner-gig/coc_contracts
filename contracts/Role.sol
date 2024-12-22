//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721URIStorageUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "./Token.sol";

event MintRole(address owner, uint256 tokenId);

contract Role is ERC721URIStorageUpgradeable, OwnableUpgradeable {
    address private _tokenContract;

    uint256 private _nextTokenId;

    uint128 private constant _MINT_ROLE_FEE = 3000000000000;

    function initialize(
        address tokenContract
    ) public initializer {
        __ERC721_init("CoCRole", "CR");
        __ERC721URIStorage_init();
        __Ownable_init(msg.sender);
        _nextTokenId = 0;
        _tokenContract = tokenContract;
    }

    function mint(address to, string memory tokenURI) public returns (uint256) {
        uint256 balance = Token(_tokenContract).balanceOf(to);
        require(balance >= _MINT_ROLE_FEE, "not enough balance!");

        Token(_tokenContract).transferFrom(to, address(this), _MINT_ROLE_FEE);

        uint256 tokenId = _nextTokenId;
        _nextTokenId++;
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);

        emit MintRole(to, tokenId);

        return tokenId;
    }

}