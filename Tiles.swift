//
//  Tiles.swift
//  challenge3
//
//  Created by Rayaan Ismail on 11/15/24.
//


import Foundation
struct Tiles{
    var snake = "🟢"
    var apple = "🍎"
    var board = "▪️"
    var head = "🐲"
    var border = "👾"
    var tail = "🍈"
    
    mutating func switchTheme(_ themeChoice: Int){
        switch themeChoice{
        case 1: // Brazil
            self.snake = "💨"
            self.apple = "⚽️"
            self.tail = "🇧🇷"
            self.head = "🏃‍♂️"
            self.border = "🌴"
            
        case 2: // USA
            self.snake = "⭐️"
            self.apple = "🦅"
            self.head = "🔴"
            self.border = "🇺🇸"
            self.tail = "🔵"
            
        case 3: // Halloween
            // Spider and fly
            self.snake = "⚫️"
            self.apple = "🪰"
            self.board = "◾️"
            self.head = "🕷️"
            self.border = "🕸️"
            self.tail = "⚫️"
            
        case 4: // Christmas
            self.snake = "🦌"
            self.apple = "🎁"
            self.board = "▫️"
            self.head = "🦌"
            self.border = "🎄"
            self.tail = "🎅"
            
        case 5: // Thanksgiving
            self.snake = "👩🏻‍🌾"
            self.apple = "🦃"
            //self.board = "🍂"
            self.head = "👨🏻‍🌾"
            self.border = "🍂"
            self.tail = "🍗"
            
        case 6: // Aquatic
            self.snake = "💧"
            self.apple = "🐠"
            //self.board = "◾️"
            self.head = "🦈"
            self.border = "🌊"
            self.tail = "💦"
            
        case 7: // St Patrick's Day
            self.snake = "🌈"
            self.apple = "💰"
            //self.board = "💚"
            self.head = "🎩"
            self.border = "🍀"
            self.tail = "🇮🇪"
            
        case 8: // Valentine's Day
            self.snake = "🌹"
            self.apple = "💔"
            //self.board = "❤️"
            self.head = "😍"
            self.border = "💖"
            self.board = "▪️"
            self.tail = "❤️"
            

        case 9: // Goth
            self.snake = "🦇"
            self.apple = "🩸"
            //self.board = "▪️"
            self.head = "🧛🏻‍♂️"
            self.border = "⬛️"
            self.tail = "⚰️"
        default:
            return
        }
    }
}
