//
//  MainDataSource.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit

final class MainDataSource: NSObject, UICollectionViewDataSource {
    
    var pokemon = [Pokemon]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Pokemon.all.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokeCell.reuseIdentifier, for: indexPath) as! PokeCell
        let pokemon = Pokemon.all[indexPath.item]
        cell.pokemon = pokemon
        return cell
    }
}
