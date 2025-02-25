//
//  Live Input Handler.swift
//  challenge3
//
//  Created by Rayaan Ismail on 11/15/24.
//

import Foundation
import Darwin
//

// Experimenting with real time CLI Inputs

//Original terminal settings (To restore later)
var oldT = termios()

// New terminal settings (Modifying them currently)
var newT = termios()

func inputLoop(_ gameModel: GameModel){
    setRawMode() // Disables echo and enter key needed
    while true {
        var buffer = [UInt8](repeating: 0, count: 1) // Buffer to save user input in (byte form)
        let bytesRead = read(STDIN_FILENO, &buffer, 1) // Variable to confirm that bytes were read from the read func
        
        if bytesRead > 0 {

            let char = String(UnicodeScalar(buffer[0])) // Converts user input from byte to string
            
            switch char {
            case "w":
                gameModel.moveSnake((0 , -1)) // x is 0 , y is -1
            case "a":
                gameModel.moveSnake((-1, 0)) // x is -1 , y is 0
            case "s":
                gameModel.moveSnake((0, 1)) // x is 0 , y is 1
            case "d":
                gameModel.moveSnake((1, 0)) // x is 1 , y is 0
            default:
                gameModel.displayBoard()
            }
            
        }
        
        if gameModel.checkLoseConditions() { break }
        
        // Only render the head if the player won (filled 100% of the board)
        if !gameModel.playerWon {
            
            gameModel.resetBoard()
            gameModel.addBoardElements()
            
            clearScreen()
            
            instructions()
            gameModel.displayBoard()
        } else {
            clearScreen()
            
            instructions()
            gameModel.displayBoard()
            printWin()
            break
        }
        
        
    }
    
    resetMode() // resets terminal back to default settings
}



func setRawMode() {
    // File descriptor for standard input (fd 0)
    // Retrieve current settings (attributes) and store in Original Terminal settings
    tcgetattr(STDIN_FILENO, &oldT)
    
    // Copy original termios to new termios for modification
    newT = oldT
    
    
    // Modify terminal settings for real time input
    // Disables canonical mode, which allows input to be processed as its typed, without requiring enter.
    // Disables ECHO which displays user input int the terminal
    newT.c_lflag &= ~UInt(ICANON | ECHO)
    
    tcsetattr(STDIN_FILENO, TCSANOW, &newT)
}

func resetMode() {
    tcsetattr(STDIN_FILENO, TCSANOW, &oldT)
}

// Clears the terminal by printing 100 new lines.
func clearScreen() {
    print("", terminator: Array(repeating: "\n", count: 100).joined())
}
