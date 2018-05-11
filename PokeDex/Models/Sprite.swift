//
//  File.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

typealias SpriteImageURLS = (regular: URL, shiny: URL)

struct Sprite {
    var regular : String
    var shiny: String
    
    
    var allUrl : SpriteImageURLS? {
        if let front = URL(string: regular), let shiny = URL(string: shiny) {
            return (front,shiny)
        }
        return nil
    }
}
