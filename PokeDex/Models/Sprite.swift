//
//  File.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

typealias SpriteImageURLS = (regular: URL, shiny: URL)

struct Sprite: Codable {
    var frontDefault : String
    var frontShiny: String

    
    var allUrl : SpriteImageURLS? {
        if let front = URL(string: frontDefault), let shiny = URL(string: frontShiny) {
            return (front,shiny)
        }
        return nil
    }
}

extension Sprite {
    static func spriteResource(withUrl spriteUrl: SpriteImageURLS) -> Resource<UIImage> {
        let imageResource = Resource<UIImage>(url: spriteUrl.regular) { (data) -> UIImage? in
            if let image = UIImage(data: data) {
                return image
            }
            return nil
        }
        return imageResource
    }
}

