//
//  Webservice.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import Foundation

final class Webservice {
    
    
    static var requestsCount = 0
    
    func load<T>(_ resource: Resource<T>, completion: @escaping(T?) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            Webservice.requestsCount += 1
            completion(resource.parse(data))
        }.resume()
    }
}
