//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Evan Leong on 10/19/15.
//  Copyright © 2015 Evan Leong. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet var mainImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var defenseLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var pokedexIDLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var attackLabel: UILabel!
    @IBOutlet var currentEvo: UIImageView!
    @IBOutlet var nextEvo: UIImageView!
    @IBOutlet var evoLabel: UILabel!
    @IBOutlet weak var pokeLabel: UILabel!
    
     var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeLabel.text = pokemon.name.capitalizedString
        var image = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = image
        currentEvo.image = image
        
        pokemon.downloadPokemonDetails { () -> () in
            // this will be called after download is done
            
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        
            descriptionLabel.text = pokemon.description
            typeLabel.text = pokemon.type
            defenseLabel.text = pokemon.defense
            heightLabel.text = pokemon.height
            pokedexIDLabel.text = "\(pokemon.pokedexId)"
            weightLabel.text = pokemon.weight
            attackLabel.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            
            evoLabel.text = "No Evolution Available"
            nextEvo.hidden = true
            
        } else {
            
            nextEvo.hidden = false
        nextEvo.image = UIImage(named: pokemon.nextEvolutionId)
            
            var string = "Next Evolution: \(pokemon.nextEvolutionText)"
            if pokemon.nextEvolutionLevel != "" {
                string += " - LVL \(pokemon.nextEvolutionLevel)"
            }
        
    }
        
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
