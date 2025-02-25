//
//  themes.swift
//  challenge3
//
//  Created by Shakira Al-Jahmee on 11/20/24.
//

import Foundation

// themes.swift
// challenge3
//
// Created by Shakira Al-Jahmee on 11/20/24.
//
import Foundation
func getTheme()-> Int{
    let themeSelection = """
\n--------------------------------------
\nChoose a theme:
A. Default    | B. Brazil
C. USA        | D. Halloween
E. Christmas  | F. Thanksgiving
G. Aquatic    | H. Saint Patricks Day
I. Valentines | J. Goth
Enter choice: 
"""
    print(themeSelection, terminator: "")
    while true {
        if let themeChoice = readLine() {
            switch themeChoice.uppercased().trimmingCharacters(in: .whitespacesAndNewlines) {
            case "A":
                return 0
            case "B":
                return 1
            case "C":
                return 2
            case "D":
                return 3
            case "E":
                return 4
            case "F":
                return 5
            case "G":
                return 6
            case "H":
                return 7
            case "I":
                return 8
            case "J":
                return 9
            default:
                print("Please choose one of the letters: ", terminator: "")
            }
        }
    }
}

