//
//  Pokemon.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation


struct Pokemon: Codable {
    let url: String
    var name: String
    static var all = [Pokemon]() 
}

extension Pokemon {
    var pokedexNumberTag : String {
        return String.find(inside: url)
    }

}

extension Pokemon {
    static let pokemonResource = Resource<Pokemon>(url: Api.pikachuEndPoint) { (data) -> Pokemon? in
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let pikachu = try! decoder.decode(Pokemon.self, from: data)
        return pikachu
    }
    
    
    static let allPokemon = Resource<PokeMapper>(url: PokeMapper.url) { (data) -> PokeMapper? in
        let decoder = JSONDecoder()
        let pokemon = try! decoder.decode(PokeMapper.self, from: data)
        return pokemon
    }
}

