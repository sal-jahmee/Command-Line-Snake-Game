//
//  Game Model Class.swift
//  challenge3
//
//  Created by Rayaan Ismail on 11/15/24.
//

import Foundation

class GameModel {
    var size: Int // Model starts with zero size
    var midPos: Int // Middle Index
    var board: [[String]] // Model starts with empty board
    var snake: [(Int, Int)] // Array of tuple coordinates
    var apple: (Int, Int) // Singular tuple coordinate
    var score: Int // # of food eaten
    var collidedWall: Bool
    var collidedSelf: Bool
    var percentageOccupied: Double
    var minWinChance: Double
    var themes: Tiles
    //var scares: JumpScares
    var playerWon: Bool
    
    // Only need to input size to init all variables
    init(size: Int, tileChoice: Int) {
        self.size = size
        midPos = (size / 2) - 1 // Sets middle coord
        snake = [(midPos, midPos), (midPos, midPos + 1)]
        score = 0
        collidedWall = false
        collidedSelf = false
        // Randomizes apple board position based on snake starting coords
        apple = ((0...size - 1).random(without: [midPos]), (0...size - 1).random(without: [midPos, midPos + 1]))
        percentageOccupied = Double(snake.count)/Double(size*size)*100.0
        minWinChance = 65.0
        themes = Tiles()
        themes.switchTheme(tileChoice)
        board = [[String]](repeating: [String](repeating: themes.board, count: size), count: size)
        //scares = JumpScares.jumpScare1
        playerWon = false
    }
    // Methods to display / mutate variables
    func resetBoard() {
        // Reset board to base tiles
        board = [[String]](repeating: [String](repeating: themes.board, count: size), count: size)
    }
    func displayBoard() {
        // Prints both arrays of board
        let horizontalBorder = Array(repeating: themes.border, count: size + 2).joined()
        print(horizontalBorder)
        for row in board {
            print(themes.border, terminator: "")
            for tile in row {
                print(tile, terminator: "")
            }
            // New line after each row
            print(themes.border, terminator: "")
            print("")
        }
        print(horizontalBorder)
        print("Score: \(score) | Occupying [\(String(format:"%.2f", percentageOccupied))%] of the board")
    }
    func respawnApple(){
        var applePos = (0, 0)
        // Randomly generate apple coordinates
        repeat {
            applePos = (Int.random(in: 0...size-1), Int.random(in: 0...size-1))
        } while snake.contains(where: {$0 == applePos})
        // Compare apple to snake using .contains
        apple = applePos
    }
    func addBoardElements() {
        // Adds snake tiles
        for i in 0...snake.count - 1 {
            if i == 0 {
                board[snake[i].1][snake[i].0] = themes.head
            } else if i == snake.count - 1{
                board[snake[i].1][snake[i].0] = themes.tail
            } else {
                board[snake[i].1][snake[i].0] = themes.snake
            }
        }
        // Adds apple tile
        board[apple.1][apple.0] = themes.apple
    }
    func moveSnake(_ direction: (Int, Int)) {
        let newHead = (snake[0].0 + direction.0, snake[0].1 + direction.1) // Adding the direction to the old snake head value
        if newHead.0 < 0 || newHead.1 < 0 || newHead.0 > size - 1 || newHead.1 > size - 1 { // Exits func if the snake would be out of bounds
            collidedWall = true
            return
        }
        if board[newHead.1][newHead.0] != themes.snake { // If new snake position is NOT already occupied
            var newSnake = [newHead] // Make a temp variable to store new snake array
            if newHead == apple{ // If the new snake position is an apple, do not delete last item in array
                for i in (0...snake.count - 1){
                    newSnake.append(snake[i])
                }
                snake = newSnake // update snake array
                if score < (size * size) - 3 {
                    respawnApple() // draw a new apple
                    score += 1
                }
                
            } else { // Else delete the last item and "move" the snake
                for i in (0...snake.count - 2){
                    newSnake.append(snake[i])
                }
                snake = newSnake // update snake array
            }
            percentageOccupied = Double(snake.count)/Double(size*size)*100.0
        }else if newHead != snake[1]{
            collidedSelf = true
            return
        }
    }
    func checkLoseConditions()-> Bool{
        let escape = "Looks like your snake tried to escape its cage! 🤦🏽‍♀️"
        let doubleBackmessage = "Looks like you tried to eat yourself... you can't be that hungry! BIG BACK 😬"
        let youWon = "Congrats on your win! You reached the \(String(format: "%.2f", minWinChance))% threshold!"
        
        
        if collidedWall && percentageOccupied < minWinChance{
            //print(jumpScares.jumpScare1.rawValue)
            print(escape)
            return true
        }else if collidedSelf && percentageOccupied < minWinChance{
           // print(jumpScares.jumpScare2.rawValue)
            print(doubleBackmessage)
            return true
        }else if percentageOccupied > minWinChance && (collidedWall || collidedSelf) {
            print(youWon)
            return true
        } else if percentageOccupied == 100.0 {
            playerWon = true
            board[snake[1].1][snake[1].0] = themes.snake
            board[snake[0].1][snake[0].0] = themes.head // Replaces head [0] with snake to avoid duplication
        }
        return false
    }
    func resetGame(_ newSize: Int) {
        size = newSize
        themes.switchTheme(getTheme())
        midPos = (size / 2) - 1 // Sets middle coord
        board = [[String]](repeating: [String](repeating: themes.board, count: size), count: size)
        snake = [(midPos, midPos), (midPos, midPos + 1)]
        score = 0
        collidedWall = false
        collidedSelf = false
        // Randomizes apple board position based on snake starting coords
        apple = ((0...size - 1).random(without: [midPos]), (0...size - 1).random(without: [midPos, midPos + 1]))
        playerWon = false
    }
}
