
# Pikachu ERC20 Tokens

This Solidity contract implements a basic ERC20 token named "Pikachu Tokens" (PikaTok) that adheres to the ERC20 standard for fungible tokens on the Ethereum blockchain.

## Installation

No installation needed.

Copy the contents of assessment.sol file and paste in a new file in the remix Ethereum website. [https://remix.ethereum.org]

Then compile and deploy the contract on the free virtual machine provided.

## Executing Program

In the deployments the variables `name`, `symbol`, and `address` can be accessed by clicking on them.

The functions `mint`, `customTransfer`, `burn` can be called by passing the required parameters into them.
## Imports

The ERC20 Template contract is imported from openzeppelin.

```
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
```
## Description 

All parts in this contract use the methods provides by the imported ERC20 Contract and just extend their ease of use.

**Constructor**

The constructor sets the owner and initialize the ERC20 contract so that it can be used.

```solidity
constructor(uint256 initialSupply) ERC20(_name, _symbol) {
    owner = msg.sender;
    _mint(owner, initialSupply);
}
```

**OnlyOwner Modifier**

This modifier is very important as it checks tfe authenticity of the user and only allow function execution if the function invoker is the owner of the current contract.

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can call this function");
     _;
}
```

**Mint function**

This function allows creation of new tokens and transfer them to a particular address. Can be only called by the owner of the deployed contract.

```solidity
function mint(address recipient, uint256 amount) public onlyOwner {
        _mint(recipient, amount);
    }
```

**Transfer function**

This fuction allow any user to transfer tokens they own to any other address on the blockchain.

```solidity
function customTransfer(address recipient, uint256 amount) public {
        _transfer(msg.sender, recipient, amount);
    }
```

**Burn function**

This function allows any user to destroy tokens that they own when they no longer have any use for them.

```solidity
function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
```
## Authors

- [@Sain-Biswas](https://github.com/Sain-Biswas)


## License

This contract is licensed under the [MIT](https://choosealicense.com/licenses/mit/) License (refer to the SPDX license identifier at the top of the contract).

