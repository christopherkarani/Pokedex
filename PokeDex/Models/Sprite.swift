//
//  File.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

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

extension Sprite {
//    static let spriteResouce = Resource<UIImage>.(url: <#T##URL#>, parse: <#T##(Data) -> UIImage?#>)
}

extension Sprite: Decodable {
    enum Keys: CodingKey {
        case frontDefault
        case frontShiny
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        regular = try container.decode(String.self, forKey: .frontDefault)
        shiny = try container.decode(String.self, forKey: .frontShiny)
    }
}
