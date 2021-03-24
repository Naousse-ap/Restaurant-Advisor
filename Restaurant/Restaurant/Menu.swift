//
//  Menu.swift
//  Restaurant
//
//  Created by Anaïs Puig on 17/03/2021.
//

import Foundation

//Définition des éléments de la table menu
struct Menu: Decodable {
    let id : Int
    let name: String
    let description: String
    let price: Float
    let picture: String
    
    init(id : Int, name: String, description: String, price: Float, picture: String) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.picture = picture
    }
}
