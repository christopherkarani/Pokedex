//
//  PokemonMapper.swift
//  PokeDex
//
//  Created by Chris Karani on 5/14/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

struct PokeMapper: Codable {
    static let retrieveLimit = 10
    static let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=\(retrieveLimit)")!
    let count: Int
    let next: String
    let previous: String?
    let results : [Pokemon]
}

