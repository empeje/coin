pragma solidity ^0.7.3;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';

contract ContractB {
    IERC20 public token;
    constructor(address _token) {
        token = IERC20(_token);
    }

    function deposit(uint amount) external {
        token.transferFrom(msg.sender, address(this), amount)   ;
    }

    function withdraw(uint amount) external {
        token.transfer(msg.sender, amount);
    }
}

contract ContractA {
    IERC20 public token;
    ContractB public contractB;

    constructor(address _token) {
        token = IERC20(_token);
        contractB = ContractB(contractB);
    }

    function deposit(uint amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        token.approve(address(contractB), amount);
        contractB.deposit(amount);
    }

    function withdraw(uint amount) external {
        contractB.withdraw(amount);
        token.transfer(msg.sender, amount);
    }
}