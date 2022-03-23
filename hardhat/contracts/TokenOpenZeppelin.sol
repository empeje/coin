pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';


contract TokenOpenZeppelin is ERC20 {
    constructor() ERC20('Token Name', 'TOKEN_TICKER') {}
}

contract TokenOpenZeppelin2 is ERC20 {
    address public admin;

    constructor() ERC20('Token Name', 'TOKEN_TICKER') {
        admin = msg.sender;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, 'only admin');
        _mint(to, amount);
    }
}

contract TokenOpenZeppelin3 is ERC20 {
    constructor() ERC20('Token Name', 'TOKEN_TICKER') {}

    function faucet(address to, uint amount) external {
        _mint(to, amount);
    }
}