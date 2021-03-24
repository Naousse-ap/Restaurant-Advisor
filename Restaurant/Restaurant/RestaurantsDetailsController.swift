//
//  RestaurantsDetailsController.swift
//  Restaurant
//
//  Created by Anaïs Puig on 14/03/2021.
//

import UIKit
import SafariServices
import Alamofire

class RestaurantsDetailsController: UIViewController {
    //Prédéfinition de l'emplacement des informations à afficher dans la page détail d'un restaurant (la gestion d'affichage est faite dans HomeTableViewController et AccountTableViewController)
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Grade: UILabel!
    @IBOutlet weak var Localization: UILabel!
    @IBOutlet weak var Phone: UILabel!
    @IBOutlet weak var Hours: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var StrName = ""
    var StrDescription = ""
    var StrGrade = "1"
    var StrLocalization = ""
    var StrPhone = ""
    var StrWebsite = ""
    var StrHours = ""
    
    //Prédifinition d'une variable permettant de récupérer l'id du restaurant pour effectuer les routes nécessitant l'id du restaurant
    var StrId = ""
    
    //Prédifinition d'une variable permettant de récupérer l'id du menu sélectionner pour effectuer la route mise à jour du menu
    var ici = ""
    var Gtid: String = ""
    
    //Appel de la stucture des Menus (dans Menu.swift)
    var menus = [Menu]()
    
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
                        self.collectionView.reloadData()
                    }
                }
            } catch {
            }
        }.resume()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
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
    
    // Fonction qui s'execute par le biais des segues (passage d'une certaine page à une autre) et qui permet de passer des variable d'un controller à un autre. Ici nous récupérons l'id du restaurant pour l'envoyer et l'utiliser dans deux pages ainsi que l'id du menu selectionné.
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        if segue.destination is UpdateController {
            let vc = segue.destination as? UpdateController
            vc?.getid = StrId
        }
        if segue.destination is addMenu {
            let vc = segue.destination as? addMenu
            vc?.getidmenu = StrId
        }
        if segue.destination is UpdateMenuController {
            let vc = segue.destination as? UpdateMenuController
            vc?.la = ici
        }
    }
    //Fonction permettant de mettre l'id du menu sélectionné dans la variable qui est envoyée par segue dans le fichier UpdateMenuController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(menus[indexPath.row].name)
        ici = "\(menus[indexPath.row].id)"
    }
}
extension RestaurantsDetailsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.count
    }
    //Fonction permettant de gérer l'affichage des menus depuis le fichier "MenuNoAccountCollectionViewCell"
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DisplayMenuCollectionViewCell", for: indexPath) as! DisplayMenuCollectionViewCell
        cell.setup(with: menus[indexPath.row])
        return cell
    }
}

//Fonction appelant la route pour supprimer un menu à partir de son id
extension RestaurantsDetailsController: UICollectionViewDelegate {
    func Del(id: Int, completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/menus/\(id)") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: urlRequest) { (data, resp, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(err)
                    return
                }
                if let resp = resp as? HTTPURLResponse, resp.statusCode != 200 {
                    let errorString = String(data: data ?? Data(), encoding: .utf8) ?? ""
                    completion(NSError(domain: "", code: resp.statusCode, userInfo: [NSLocalizedDescriptionKey: errorString]))
                    return
                }
                completion(nil)
            }
        }.resume()
    }
    
    //Fonction appelant la fonction de delete des menus. Les menus sont supprimer grâce à l'id du menu
    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        let menu = self.menus[indexPath.row]
        Del(id: menu.id) { (err) in
            if let err = err {
                return
            }
            self.menus.remove(at: indexPath.row)
            collectionView.deleteItems(at: [indexPath])
        }
    }
    
    //Fonction pour partager le liens du restaurants    
    @IBAction func sharePressed(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.StrWebsite], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
}

//Fonction qui définit la taille de la collectionView.
extension RestaurantsDetailsController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 358, height: 400)
    }
}
