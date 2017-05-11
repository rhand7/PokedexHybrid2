//
//  PokemonSearchViewController.swift
//  PokedexHybrid2
//
//  Created by handje on 5/11/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import UIKit

class PokemonSearchViewController: UIViewController, UISearchBarDelegate {
    
    //IB Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var abilitiesLabel: UILabel!
    
    //SearchBar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        DMNPokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            DispatchQueue.main.async {
                guard let pokemon = pokemon else { return }
                self.nameLabel.text = pokemon.name
                self.idLabel.text = "ID: \(pokemon.identifier)"
                self.abilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
}
