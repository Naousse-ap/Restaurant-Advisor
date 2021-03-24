//
//  AcoountTableViewController.swift
//  Restaurant
//
//  Created by Anaïs Puig on 15/03/2021.
//

import UIKit
import Alamofire

struct RestaurantAccount: Decodable {
    let id : Int
    let name: String
    let description: String
    let grade: Float
    let localization: String
    let phone_number: String
    let website: String
    let hours: String
    let picture: String
    
    init(id : Int, name: String, description: String, grade: Float, localization: String, phone_number: String, website: String, hours: String, picture: String) {
        self.id = id
        self.name = name
        self.description = description
        self.grade = grade
        self.localization = localization
        self.phone_number = phone_number
        self.website = website
        self.hours = hours
        self.picture = picture
    }
}
class AccountTableViewController: UITableViewController {
    
    var restaurants = [RestaurantAccount]()
    var refresher: UIRefreshControl!
    
    //Fonction pour se déconnecter, renvoie sur la page d'authentification
    @IBAction func logout(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Main")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Fonction pour boutton permettant de se rendre sur la page formulaire pour créer un nouveau restaurant
    @IBAction func CreateRestaurant(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "addrestaurant")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    // Appel de la route pour récupérer tous les restaurants de la base de donnée
    override func viewDidLoad() {
        super.viewDidLoad()
        let myUrl: URL = URL(string: "http://127.0.0.1:8000/api/restaurants")!
        Alamofire.request(myUrl, method: .get).responseJSON { (response) in
            let result = response.data
            do {
                try self.restaurants = JSONDecoder().decode([RestaurantAccount].self, from: result!)
                for restaurant in self.restaurants {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch {
            }
        }.resume()
    }
    
    //Fonction pour faire appel à la route permettant de supprimer un restaurant à partir de son id
    func Supp(id: Int, completion: @escaping (Error?) -> ()) {
        guard let url = URL(string: "http://127.0.0.1:8000/api/restaurant/\(id)") else { return }
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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }
    
    //Atribution des informations recupérées de la base de donnée aux emplacements prévus dans la page d'accueil
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RestaurantsCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! RestaurantsCell
        cell.Name.text = (restaurants[indexPath.row].name)
        
        let grade = "\(restaurants[indexPath.row].grade)"
        cell.Grade.text = grade
        
        if let imageURL = URL(string: restaurants[indexPath.row].picture) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.Picture.image = image
                    }
                }
            }
        }
        return cell
    }
    
    //Attribution des informations récupées de la base de donnée aux emplacements prévus(définis dans RestaurantDétailsNoAccController) dans les pages détails des restaurants
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail:RestaurantsDetailsController = self.storyboard?.instantiateViewController(withIdentifier: "AccountDetailsController") as!
            RestaurantsDetailsController
        
        detail.StrDescription = restaurants[indexPath.row].description
        detail.StrName = restaurants[indexPath.row].name
        detail.StrLocalization = restaurants[indexPath.row].localization
        detail.StrHours = restaurants[indexPath.row].hours
        detail.StrPhone = restaurants[indexPath.row].phone_number
        detail.StrWebsite = restaurants[indexPath.row].website
        
        //Attribution d'un int au Label (Str) prévu
        let grade = "\(restaurants[indexPath.row].grade)"
        detail.StrGrade = grade
        let id = "\(restaurants[indexPath.row].id)"
        detail.StrId = id
        
        //Attribution d'un URL de photo au ImagView
        if let imageURL = URL(string: restaurants[indexPath.row].picture) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        detail.image.image = image
                    }
                }
            }
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    //Application de la fonction permettant de supprimer un restaurant à partir de son id en swipant la photo du restaurant
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let restau = self.restaurants[indexPath.row]
            Supp(id: restau.id) { (err) in
                if let err = err {
                    return
                }
                
                self.restaurants.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
}
