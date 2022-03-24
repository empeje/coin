pragma solidity >=0.8.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol';
import '@openzeppelin/contracts/token/ERC721/IERC721.sol';

contract ContractB is ERC721Holder {
    function deposit(uint tokenId) external {}
    function withdraw(uint tokenId) external {}
}

contract ContractA is ERC721Holder {
    ContractB public contractB;
    IERC721 public token;

    constructor(address _token, address _contractB) {
        token = IERC721(_token);
        contractB = ContractB(_contractB);
    }

    function deposit(uint tokenId) external {
        token.safeTransferFrom(msg.sender, address(this), tokenId);
        token.approve(address(contractB), tokenId);
        contractB.deposit(tokenId);
    }

    function withdraw(uint tokenId) external {
        contractB.withdraw(tokenId);
        token.safeTransferFrom(address(this), msg.sender, tokenId);
    }
}