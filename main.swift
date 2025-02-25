//
//  main.swift
//  challenge3
//
//  Created by Shakira Al-Jahmee on 11/13/24.
//

import Foundation

// Auto generates game model depending on board size (See class for info)
let gameModel = GameModel(size: playerIntro(), tileChoice: getTheme())

func main() {
    instructions()
    
    // Initializes game elements after player introduction
    gameModel.addBoardElements()
    
    // Prints the board
    gameModel.displayBoard()
    
    // Handle live user input (returns gameModel)
    while true {
        
        inputLoop(gameModel)
        
        if !restartGame() {
            
            break
            
        } else {
            
            clearScreen()
            gameModel.resetGame(playerIntro())
            instructions()
            gameModel.addBoardElements()
            gameModel.displayBoard()
            
        }
    }
}
main()


