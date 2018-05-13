//
//  Data_Ext.swift
//  PokeDex
//
//  Created by Chris Karani on 5/14/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

extension Data {
    var stringDescription: String {
        return String(data: self, encoding: .utf8)!
    }
}
