//
//  UpdateMenuController.swift
//  Restaurant
//
//  Created by Anaïs Puig on 18/03/2021.
//

import UIKit
import Alamofire
import SafariServices

class UpdateMenuController: UIViewController {
    
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Hname: UILabel!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var Hdescription: UILabel!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var Hprice: UILabel!
    @IBOutlet weak var Picture: UITextField!
    @IBOutlet weak var Hpicture: UILabel!
    
    @IBAction func SafariPicture(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.google.com")!)
        present(vc, animated: true)

    }
    
    //Icone Textfield
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nameImage = UIImage(named:"name restau")
        addLeftImageTo(txtField: Name, andImage: nameImage!)
        
        let descriptionImage = UIImage(named:"description")
        addLeftImageTo(txtField: Description, andImage: descriptionImage!)
        
        let priceImage = UIImage(named:"price")
        addLeftImageTo(txtField: Price, andImage: priceImage!)
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    
    //Déclaration de la variable permettant de récupérer l'id du menu à mettre à jour (depuis le RestaurantsDetailsController)
    var la:String = ""
    
    @objc func verifisempty() {
        if (Name.text?.count == 0){
            Hname.text = "Please enter your name"
        }else{
            Hname.text = ""
        }
        if (Description.text?.count == 0){
            Hdescription.text = "Please enter a description"
        }else{
            Hdescription.text = ""
        }
        if (Price.text?.count == 0){
            Hprice.text = "Please enter a price"
        }else{
            Hprice.text = ""
        }
        if (Picture.text?.count == 0){
            Hpicture.text = "Please enter picture"
        }else{
            Hpicture.text = ""
        }
    }
    
    //Renvoie à la page d'accueil des restaurants
    func GoToHome(){
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Création d'une alerte
    private func presentAlert() {
        // create the alert
        let alert = UIAlertController(title: "Error", message: "The menu could not be updated. Please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func UpdateMenu(_ sender: Any) {
        //vérification des champs
        verifisempty()
        //récupération des paramètres
        let parameters :[String: Any]  = ["name": Name.text!,"description": Description.text!,"price": Price.text!,"picture": Picture.text!]
        Alamofire.request(URL(string: "http://127.0.0.1:8000/api/menus/\(la)")!, method: .put, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            if response.response!.statusCode == 200 {
                self.GoToHome()
            } else {
                self.presentAlert()
            }
        }
    }
}
