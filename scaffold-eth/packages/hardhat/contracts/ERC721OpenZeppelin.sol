pragma solidity >=0.8.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract ERC721OpenZeppelin1 is ERC721 {
    constructor() ERC721('Token Name', 'Token Symbol') {}
}