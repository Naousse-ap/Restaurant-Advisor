//
//  addMenu.swift
//  Restaurant
//
//  Created by Lucie Granier on 18/03/2021.
//

import UIKit
import Alamofire
import SafariServices

class addMenu: UIViewController {
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Hname: UILabel!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var Hdescription: UILabel!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var Hprice: UILabel!
    @IBOutlet weak var Picture: UITextField!
    @IBOutlet weak var Hpicture: UILabel!
    
    var getidmenu:String = ""
  
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
    
    //Retourner à la page des menus
    @IBAction func BackMenu(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Fonction pour verifier le remplissage des champs
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
    
    //Renvoie à la page d'accueil
    func GoToRestaurant(){
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Création d'une alerte signalant que le menu n'a pas pu être crée
    private func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "The menu could not be created. Please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Appel de la route de l'api pour la création du menu
    @IBAction func add(_ sender: Any) {
        let myUrl: URL = URL(string: "http://127.0.0.1:8000/api/restaurants/\(getidmenu)/menus")!
        var myRequest: URLRequest = URLRequest(url: myUrl);
        myRequest.httpMethod = "POST";
        
        //Vérification des champs
        verifisempty()
        
        //Récupérarion des paramètres dans les textfields
        let postString = "name=\(Name.text!)&& description=\(Description.text!)&&price=\(Price.text!)&&picture=\(Picture.text!)"
        myRequest.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: myRequest) { [self]data, response, error in
            //verification des status code
            let statusCode = (response as! HTTPURLResponse).statusCode;
            if(statusCode == 201){
                DispatchQueue.main.async {
                    //Si tout c'est bien passé retour au menu
                    GoToRestaurant()
                }
            }else {
                DispatchQueue.main.async {
                    //Si la requete à échoué affichage de l'alerte
                    presentAlert()
                }
            }
        }
        task.resume()
    }
}

