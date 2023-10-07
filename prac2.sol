//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RockPaperScissors {
    address public owner;
    uint256 public betAmount = 100000;
    
    enum Move { Rock, Paper, Scissors }
    
    struct Game {
        address player;
        Move playerMove;
        Move contractMove;
        bool playerWon;
    }
    
    Game[] public gameHistory;
    
    constructor() {
        owner = msg.sender;
    }
    
    function play(Move _playerMove) external payable {
        require(msg.value == betAmount, "Incorrect bet amount");
        
        // Randomly generate a move for the contract
        Move _contractMove = getRandomMove();
        
        // Determine the winner
        bool _playerWon = determineWinner(_playerMove, _contractMove);
        
        // Pay out rewards if the player won
        if (_playerWon) {
            payable(msg.sender).transfer(betAmount * 2);
        }
        
        // Store the game in the history
        gameHistory.push(Game(msg.sender, _playerMove, _contractMove, _playerWon));
    }
    
    function getRandomMove() internal view returns (Move) {
        // Implement a function to generate a random move
    }
    
    function determineWinner(Move _playerMove, Move _contractMove) internal pure returns (bool) {
        // Implement the logic to determine the winner
    }
}
