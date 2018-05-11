//  File.swift
//  PokeDex
//
//  Created by Chris Karani on 5/11/18.
//  Copyright © 2018 Chris Karani. All rights reserved.
//

import UIKit
import SnapKit

class PokeCell: UICollectionViewCell {
    
    var pokemon: Pokemon? {
        didSet {
            if let pokemon  = pokemon {
                handleTextRendering(withPokemon: pokemon)
            }
        }
    }
    
    
    
    let spriteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "8-Bit Madness", size: UIFont.labelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "8-Bit Madness", size: UIFont.labelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    fileprivate func setupUI() {
        addSubview(spriteImage)
        addSubview(nameLabel)
        addSubview(idLabel)
        
        spriteImage.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        idLabel.snp.makeConstraints { (make) in
            make.top.equalTo(spriteImage.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    
    func handleTextRendering(withPokemon pokemon: Pokemon) {
        
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family), FontNames: \(names)")
        }
        let font = UIFont(name: Font.name, size: UIFont.labelFontSize)!
        let nameTitle = NSMutableAttributedString(string: "Name: ", attributes: [.font : font])
        nameTitle.append(NSAttributedString(string: pokemon.name.uppercased(), attributes: [.font : font]))
        
        let idTitle = NSMutableAttributedString(string: "ID: ", attributes: [.font : font])
        idTitle.append(NSAttributedString(string: String(describing: pokemon.id), attributes: [.font : font]))
        
        nameLabel.attributedText = nameTitle
        idLabel.attributedText = idTitle
    }
    
    func handleImageRendering(withPokemon pokemon: Pokemon) {
        let url = pokemon.sprites.allUrl?.regular
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokeCell {
    static let reuseIdentifier = "PokeCell"
}
