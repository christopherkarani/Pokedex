//
//  ViewController.swift
//  PokeDex
//
//  Created by Chris Karani on 5/10/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    let dataSource = MainDataSource()
    let flowLayoutDelegate = MainCollectionViewDelegate()
    
    fileprivate func setupCollectionView() {
        collectionView?.dataSource = dataSource
        collectionView?.delegate = flowLayoutDelegate
        collectionView?.backgroundColor = .white
        collectionView?.register(PokeCell.self, forCellWithReuseIdentifier: PokeCell.reuseIdentifier)
    }
    
    func getData() {
        let group = DispatchGroup()
        
        for count in 1...25 {
            group.enter()
            guard let url = URL(string: "http://pokeapi.co/api/v2/pokemon/\(count)") else { return }
            let res = Resource<Pokemon>(url: url) { (data) -> Pokemon? in
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pikachu = try? decoder.decode(Pokemon.self, from: data)
                return pikachu
            }
            Webservice().load(res) { (pokemon) in
                Pokemon.all.append(pokemon!)
                group.leave()
            }
        }

        
        group.notify(queue: .main) {
             self.collectionView?.reloadData()
        }

    }
    
    func getPokemonData() {
        Webservice().load(Pokemon.allPokemon) { (mapper) in
            guard let mapper = mapper else { return }
            Pokemon.all += mapper.results
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getPokemonData()
        setupCollectionView()
        setup(navigationTitle: navigationItem)
    }
    
    func getAllPokemon() {
//        Webservice().load(Pokemon.allPokemon) { (pokemon) in
//            print(pokemon!.count)
//        }
    }
    
    fileprivate func setup(navigationTitle item: UINavigationItem) {
        item.title = "Pokedex"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


