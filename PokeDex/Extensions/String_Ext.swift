//
//  String_Ext.swift
//  PokeDex
//
//  Created by Chris Karani on 5/14/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

extension String {
    
    var toCharacter: Character {
        return Character(self)
    }
    
    static func find(inside text: String) -> String {
        var originalArray = text.reversed().filter { char in
            return char.notEqual(to: "/")
        }
        
        for char in originalArray where char.isEqual(to: "v".toCharacter) {
            guard let index = originalArray.index(of: char) else { fatalError() }
            originalArray.remove(at: index - 1) // remove value before
        }
        
        let numbersOnly = originalArray.compactMap { char -> Character? in
            if char.isInteger {
                return char
            }
            return nil
        }
        
        let str = numbersOnly.combinePokedexNumbers()
        return str
    }
}
