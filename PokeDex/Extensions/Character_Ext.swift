//
//  Character_Ext.swift
//  PokeDex
//
//  Created by Chris Karani on 5/14/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

extension Character {
    
    // some helpers methods to help when parsing Pokdex number from urlString
    func isEqual(to char: Character) -> Bool {
        return self == char
    }
    
    func notEqual(to char: Character) -> Bool {
        return self != char
    }
    
    var isInteger: Bool {
        let string = String(self)
        return Int(string) != nil
    }
}
