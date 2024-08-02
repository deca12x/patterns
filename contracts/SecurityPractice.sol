// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
// import "@openzeppelin/contracts/access/Ownable.sol";

contract DogGame {
    address owner;
    address payable[] public players;
    address payable[] public winners;

    constructor()  {
        owner = msg.sender;
    }

    function addPlayer() public payable {
        require(msg.value >= 1000000000000000000, "Minimum bet is 1 ETH");
        address payable[] memory _players = players;
        for (uint256 i = 0; i < _players.length; i++) {
            require(_players[i] != payable(msg.sender), "Player already in the game");
        }
        players.push(payable(msg.sender));
    }

    function addWinner(address payable _winner) public {
        require(msg.sender == owner, "Only the owner can add winners");
        address payable[] memory _players = players;
        for (uint256 i = 0; i < _players.length; i++) {
            if (_players[i] == _winner) {
                winners.push(_winner);
                break;
            }
        }
        if (winners.length == 3) {
            payWinners();
        }
    }

    function payWinners() private {
        uint256 amountToPay = address(this).balance / 3;
        for (uint256 i = 0; i < 3; i++) {
            winners[i].transfer(amountToPay);
        }
    }
}
