# <h1 align="center"> Final Project, Expert Solidity Bootcamp, Encode Club, Mar 2024 </h1>

1. Take contracts from ZK bootcamp final project of @hroyo & @BigBangInfinity https://github.com/hroyo/Zk-encode
2. Write Foundry Tests
3. Create various versions with different design patterns that pass the tests
4. Optimise gas

{"type":"excalidraw/clipboard","elements":[{"type":"rectangle","version":1039,"versionNonce":1407421798,"isDeleted":false,"id":"8R4ploNjhA2y0RGWpHxuz","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"angle":0,"x":1855.0727741662986,"y":1599.5939331194145,"strokeColor":"#1e1e1e","backgroundColor":"#ffec99","width":192.6127005034738,"height":117.66055934736596,"seed":1052347002,"groupIds":[],"frameId":null,"roundness":{"type":3},"boundElements":[{"type":"text","id":"l5lKGyR5ayVUAJ1PWO09m"},{"id":"U_8BF6DfnAywx8fNfnUSj","type":"arrow"}],"updated":1711736018770,"link":null,"locked":false},{"type":"text","version":1305,"versionNonce":1612247206,"isDeleted":false,"id":"l5lKGyR5ayVUAJ1PWO09m","fillStyle":"solid","strokeWidth":2,"strokeStyle":"solid","roughness":1,"opacity":100,"angle":0,"x":1874.7291915567073,"y":1633.4242127930975,"strokeColor":"#1e1e1e","backgroundColor":"#ffc9c9","width":153.29986572265625,"height":50,"seed":852896570,"groupIds":[],"frameId":null,"roundness":null,"boundElements":[],"updated":1711736018770,"link":null,"locked":false,"fontSize":20,"fontFamily":1,"text":"Implementation \nContract 1","textAlign":"center","verticalAlign":"middle","containerId":"8R4ploNjhA2y0RGWpHxuz","originalText":"Implementation Contract 1","lineHeight":1.25}],"files":{}}

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
