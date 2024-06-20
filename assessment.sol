// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner;

    string public constant _name = "Pikachu Tokens";
    string public constant _symbol = "PikaTok";

    constructor(uint256 initialSupply) ERC20(_name, _symbol) {
        owner = msg.sender;
        _mint(owner, initialSupply);
    }

    function mint(address recipient, uint256 amount) public onlyOwner {
        _mint(recipient, amount);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    function customTransfer(address recipient, uint256 amount) public {
        _transfer(msg.sender, recipient, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}

