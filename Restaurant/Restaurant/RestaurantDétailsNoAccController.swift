//
//  RestaurantDétailsNoAccController.swift
//  Restaurant
//
//  Created by Anaïs Puig on 18/03/2021.
//

import UIKit
import SafariServices
import Alamofire

class RestaurantDétailsNoAccController: UIViewController {
    //Prédéfinition de l'emplacement des informations à afficher dans la page détail d'un restaurant (la gestion d'affichage est faite dans HomeTableViewController et AccountTableViewController)
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var Localization: UILabel!
    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var Website: UILabel!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Grade: UILabel!
    @IBOutlet weak var viewCollection: UICollectionView!
    
    var StrName = ""
    var StrDescription = ""
    var StrGrade = "1"
    var StrLocalization = ""
    var StrPhone = ""
    var StrWebsite = ""
    var StrHours = ""
    
    //Appel de la stucture des Menus (dans Menu.swift)
    var menus = [Menu]()
    
    //Prédifinition d'une variable permettant de récupérer l'id du restaurant pour effectuer les routes nécessitant l'id du restaurant
    var StrId = ""
    //
    var Gtid: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.text = StrName
        Description.text = StrDescription
        Grade.text = StrGrade
        Localization.text = StrLocalization
        Phone.text = StrPhone
        //Website.text = StrWebsite
        Hours.text = StrHours
        //Appel de la requête permettant de récupérer les menus d'un restaurant d'après son id
        let myUrl: URL = URL(string: "http://127.0.0.1:8000/api/restaurants/\(StrId)/menus")!
        Alamofire.request(myUrl, method: .get).responseJSON { (response) in
            let result = response.data
            do {
                try self.menus = JSONDecoder().decode([Menu].self, from: result!)
                for menus in self.menus {
                    DispatchQueue.main.async {
                        self.viewCollection.reloadData()
                    }
                }
            } catch {
            }
        }.resume()
        
        viewCollection.dataSource = self
        viewCollection.delegate = self
        viewCollection.collectionViewLayout = UICollectionViewFlowLayout()
    }
    
    //Fonction qui se lance quand on appuie sur l'ordinateur permettant d'ouvrir le site internet du restaurant.
    @IBAction func safari(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: StrWebsite)!)
        present(vc, animated: true)
    }
    @IBAction func safarinoaccount(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: StrWebsite)!)
        present(vc, animated: true)
    }
    
    // Fonction qui s'execute par le biais des segues (passage d'une certaine page à une autre) et qui permet de passer des variable d'un controller à un autre. Ici nous récupérons l'id du restaurant pour l'envoyer et l'utiliser dans deux pages 
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        if segue.destination is UpdateController {
            let vc = segue.destination as? UpdateController
            vc?.getid = StrId
        }
        if segue.destination is addMenu {
            let vc = segue.destination as? addMenu
            vc?.getidmenu = StrId
        }
    }
}

extension RestaurantDétailsNoAccController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    //Fonction permettant de gérer l'affichage des menus depuis le fichier "MenuNoAccountCollectionViewCell"
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuNoAccountCollectionViewCell", for: indexPath) as! MenuNoAccountCollectionViewCell
        cell.setup(with: menus[indexPath.row])
        return cell
    }
}

//Fonction qui définit la taille de la collectionView.
extension RestaurantDétailsNoAccController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 358, height: 400)
    }
}

