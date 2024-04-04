# <h1 align="center"> Final Project, Expert Solidity Bootcamp, Encode Club, Mar 2024 </h1>

A project by @deca12x & @BigBangInfinity

1. Take contracts from ZK bootcamp final project of @hroyo & @BigBangInfinity https://github.com/hroyo/Zk-encode
2. Write Foundry Tests
3. Create various versions with different design patterns that pass the tests
4. Optimise gas

<img width="268" alt="Screenshot 2024-03-29 at 18 22 31" src="https://github.com/deca12x/patterns/assets/74135582/835d2db7-0971-441a-b56a-5ce318c77919">



# <h1 align="center"> Forge Template </h1>

**Template repository for getting started quickly with Foundry projects**

![Github Actions](https://github.com/foundry-rs/forge-template/workflows/CI/badge.svg)

## Getting Started

Click "Use this template" on [GitHub](https://github.com/foundry-rs/forge-template) to create a new repository with this repo as the initial state.

Or, if your repo already exists, run:
```sh
forge init
forge build
forge test
```

## Writing your first test

All you need is to `import forge-std/Test.sol` and then inherit it from your test contract. Forge-std's Test contract comes with a pre-instatiated [cheatcodes environment](https://book.getfoundry.sh/cheatcodes/), the `vm`. It also has support for [ds-test](https://book.getfoundry.sh/reference/ds-test.html)-style logs and assertions. Finally, it supports Hardhat's [console.log](https://github.com/brockelmore/forge-std/blob/master/src/console.sol). The logging functionalities require `-vvvv`.

```solidity
pragma solidity 0.8.10;

import "forge-std/Test.sol";

contract ContractTest is Test {
    function testExample() public {
        vm.roll(100);
        console.log(1);
        emit log("hi");
        assertTrue(true);
    }
}
```

## Development

This project uses [Foundry](https://getfoundry.sh). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.
