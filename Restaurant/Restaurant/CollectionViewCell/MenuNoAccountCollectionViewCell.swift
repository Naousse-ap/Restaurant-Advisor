//
//  MenuNoAccountCollectionViewCell.swift
//  Restaurant
//
//  Created by Anaïs Puig on 18/03/2021.
//

import UIKit

class MenuNoAccountCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    //Prédéfinition des emplacements des éléments d'affichage des menus
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Price: UILabel!
    
    //Fonction déterminant l'attribution des informations au emplacements prédéfinis
    func setup(with menu: Menu) {
        Name.text = menu.name
        if let imageURL = URL(string: menu.picture) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.Picture.image = image
                    }
                }
            }
        }
        Description.text = menu.description
        Price.text = "\(menu.price)"
    }
}
