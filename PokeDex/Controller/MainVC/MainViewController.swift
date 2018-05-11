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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


