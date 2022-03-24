pragma solidity >=0.8.0 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract YourContract1 is ERC721 {
    constructor() ERC721('Token Name', 'My NFT') {}
}

contract YourContract2 is ERC721 {
    constructor() ERC721('Token Name', 'My NFT') {
        _safeMint(msg.sender, 0);
        _safeMint(msg.sender, 1);
    }
}

contract YourContract3 is ERC721 {
    address public admin;

    constructor() ERC721('Token Name', 'Token Symbol') {
        admin = msg.sender;
    }

    function mint(address to, uint tokenId) external {
        require(msg.sender == admin, 'only admin');
        _safeMint(to, tokenId);
    }
}

contract YourContract is ERC721 {
    constructor() ERC721('Token Name', 'Token Symbol') {}

    function mint(address to, uint tokenId) external {
        _safeMint(to, tokenId);
    }
}