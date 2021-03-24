//
//  RestaurantsCell.swift
//  Restaurant
//
//  Created by Anaïs Puig on 13/03/2021.
//

import UIKit

class RestaurantsCell: UITableViewCell {
    //Prédéfinition de l'emplacement des informations à afficher dans la page d'accueil (la gestion d'affichage est faite dans HomeTableViewController et AccountTableViewController)
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Grade: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
