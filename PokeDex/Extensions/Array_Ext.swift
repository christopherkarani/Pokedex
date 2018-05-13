//
//  Array_Ext.swift
//  PokeDex
//
//  Created by Chris Karani on 5/14/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation


extension Array {
    //combine numbers array to form a string
    func combinePokedexNumbers() -> String {
        var str = self.reduce(""){ value, result in
            return "\(value)\(result)"
        }
        str.insert("#", at: str.startIndex)
        return str
    }
}
