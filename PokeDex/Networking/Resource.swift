//
//  Resource.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse : (Data) -> T?
}
