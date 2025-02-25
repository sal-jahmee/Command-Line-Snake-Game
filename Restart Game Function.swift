//
//  Restart Game Function.swift
//  challenge3
//
//  Created by Danielle Abrams on 11/19/24.
//

import Foundation

func restartGame() -> Bool {
    print("\nWould you like to play again? \nPlease Enter (y/n):", terminator: "")
    
    while true {
        if let answer = readLine() {
            switch answer.uppercased().trimmingCharacters(in: .whitespacesAndNewlines) {
            case "Y":
                return true
            case "N":
                return false
            default:
                print("Would you like to play again? \nPlease Enter (y/n):", terminator: "")
            }
        }
    }
}
