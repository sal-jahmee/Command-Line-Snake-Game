//
//  intro.swift
//  challenge3
//
//  Created by Shakira Al-Jahmee on 11/13/24.
//

import Foundation

func playerIntro()-> Int {
    
    print("Welcome to Snake! 🐍")
    print("What size do you want your board to be?")
    print("A. 6x6\nB. 16x16\nC. 22x22")
    
    print("Choose size: ", terminator: "")
    
    var gettingInput = true
    while gettingInput {
        
        if let answer = readLine() {
            switch answer.uppercased().trimmingCharacters(in: .whitespacesAndNewlines) {
            case "A":
                return 6
            case "B":
                return 16
            case "C":
                return 22
            default:
                print("Did you read the instructions? ENTER A, B or C : ", terminator: "")
                gettingInput = true
            }
        }
        
    
    }
    return 0
}


