//
//  PokeCell.swift
//  pokedex
//
//  Created by Evan Leong on 10/18/15.
//  Copyright © 2015 Evan Leong. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var thumbLabel: UILabel!
    
    var pokemon: Pokemon!
    
    required init? (coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 6.0
        self.clipsToBounds = true
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        thumbLabel.text = self.pokemon.name.capitalizedString
        thumbImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
        
    }

}
