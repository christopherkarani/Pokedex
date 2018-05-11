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
    
    func handleTextRendering(withPokemon pokemon: Pokemon) {
        guard let font = UIFont(name: Font.name, size: UIFont.labelFontSize) else { return }
        let nameTitle = NSMutableAttributedString(string: "Name: ", attributes: [.font : font])
        nameTitle.append(NSAttributedString(string: pokemon.name, attributes: [.font : font]))
        
        let idTitle = NSMutableAttributedString(string: "ID: ", attributes: [.font : font])
        idTitle.append(NSAttributedString(string: String(describing: pokemon.id), attributes: [.font : font]))
        
        nameLabel.attributedText = nameTitle
        idLabel.attributedText = idTitle
    }
    
    
    let spriteImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .orange
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "8-Bit Madness", size: UIFont.labelFontSize)
        label.backgroundColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.font = UIFont(name: "8-Bit Madness", size: UIFont.labelFontSize)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
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
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PokeCell {
    static let reuseIdentifier = "PokeCell"
}
