//
//  Pokemon.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation


struct Pokemon: Decodable {
    var id: Int
    var name: String
    var sprites: Sprite
    
    static var all = [Pokemon]() 
}

extension Pokemon {
    static let pokemonResource = Resource<Pokemon>(url: Api.pikachuEndPoint) { (data) -> Pokemon? in
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let pikachu = try! decoder.decode(Pokemon.self, from: data)
        return pikachu
    }
}

