# Truffle & Webpack dApps Built on Ethereum
Want a sticker? Me Too

### Using:
- [Nodejs 5.0+](https://nodejs.org/en/)
- [Truffle](https://github.com/trufflesuite/truffle)
- [Ganache](http://truffleframework.com/ganache/)
- [Solidity](http://solidity.readthedocs.io/en/develop/index.html)
- [web3.js](https://github.com/ethereum/web3.js/)

### Not using but grateful for:
+ https://github.com/tko22/truffle-webpack-boilerplate.git
+ https://medium.freecodecamp.org/developing-an-ethereum-decentralized-voting-application-a99de24992d9
+ https://hackernoon.com/ethereum-development-walkthrough-part-2-truffle-ganache-geth-and-mist-8d6320e12269
+ http://truffleframework.com/tutorials/pet-shop

# Run It Yourself  

(Make sure a ganache instance is running)
```
npm install -g truffle
npm clone https://github.com/krosenk729/hipsterspondence.git
cd hipsterspondence
npm install
truffle develop
truffle compile
truffle migrate
```

To run tests, run
``` 
truffle test 
```

## OOh So That's How The File Structure Works?
- contracts/ — Folder holding all of the Contracts
- migrations/ — Folder holding Migration files, which help you deploy your smart contracts into the Blockchain
- src/ — holds the HTML/CSS and Javascript files for the application
- truffle.js — Truffle Configuration file
- build/ - holds the build artifacts

## Hmm? What Are Those Jargons?

1. *Smart Contracts* act as the back-end logic and storage. A contract is written in Solidity, a smart contract language, and is a collection of code and data that resides at a specific address on the Ethereum blockchain. It’s very similar to a class in Object Oriented Programming, where it includes functions and state variables. Smart Contracts, along with the Blockchain, are the basis of all Decentralized Applications. They are, like Blockchain, immutable and distributed, which means upgrading them will be a pain if they are already on the Ethereum Network. 1. *Artifacts* are information about our contract such as its deployed address and Application Binary Interface (ABI). The ABI is a JavaScript object defining how to interact with the contract including its variables, functions and their parameters
1. *The Ethereum Virtual Machine(EVM)* handles the internal state and computation of the entire Ethereum Network. Think of the EVM as this massive decentralized computer that contains “addresses” that are capable of executing code, changing data, and interacting with each other.
1. *Web3.js* is a Javascript API that allows you to interact with the Blockchain, including making transactions and calls to smart contracts. This API abstracts the communication with Ethereum Clients, allowing developers to focus on the content of their application. You must have a web3 instance imbedded in your browser to do so.

1. *Truffle* is a popular testing development framework for Ethereum. It includes a development blockchain, compilation and migration scripts to deploy your contract to the Blockchain, contract testing, and so on. 
1. *Truffle Contracts* is an abstraction on top of the Web3 Javascript API, allowing you to easily connect and interact with your Smart Contract.
1. *Metamask* brings Ethereum to your browser. It is a browser extension that provides a secure web3 instance linked to your Ethereum address, allowing you to use Decentralized Applications. 

-------------------------

### A Few Things To Remember

+ In Solidity the types of both the function parameters and output must be specified
+ Solidity is a compiled language -- it must be compiled to bytecode for the Ethereum Virtual Machine (EVM) to execute `truffle compile`
+ Port `7545` is for truffle develop and `9545` is for Ganache