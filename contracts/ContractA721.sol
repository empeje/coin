pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC721/ERC721Holder.sol';
import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

contract ContractA721 is ERC721Holder {
    IERC721 public token;

    constructor(address _token) {
        token = IERC721(_token);
    }

    function deposit(uint tokenId) external {
        token.safeTransferFrom(msg.sender, address(this), tokenId);
    }

    function withdraw(uint tokenId) external {
        token.safeTransferFrom(address(this), msg.sender, tokenId);
    }
}