//
//  File.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

struct Api {
    static let allPokemon = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=25")!
    static let pikachuEndPoint = URL(string: "http://pokeapi.co/api/v2/pokemon/500")!
}
