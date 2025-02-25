//
//  Range Excluding Extension.swift
//  challenge3
//
//  Created by Rayaan Ismail on 11/15/24.
//

import Foundation

extension ClosedRange where Element: Hashable {
    func random(without excluded: [Element]) -> Element {
        // Create a Set of all elements in the range and remove the excluded ones
        let valid = Set(self).subtracting(Set(excluded))
        
        // Generate a random index based on the number of valid elements
        let random = Int(arc4random_uniform(UInt32(valid.count)))
        
        // Convert the Set to an Array and return a random element from it
        return Array(valid)[random]
    }
}
