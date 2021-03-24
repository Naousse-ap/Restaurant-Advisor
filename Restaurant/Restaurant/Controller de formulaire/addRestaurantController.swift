//
//  addRestaurantController.swift
//  Restaurant
//
//  Created by Lucie Granier on 15/03/2021.
//

import UIKit
import Alamofire
import SafariServices

class addRestaurantController: UIViewController {
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Hname: UILabel!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var Hdescription: UILabel!
    @IBOutlet weak var Grade: UITextField!
    @IBOutlet weak var Hgrade: UILabel!
    @IBOutlet weak var Localization: UITextField!
    @IBOutlet weak var Hlocalization: UILabel!
    @IBOutlet weak var PhoneNumber: UITextField!
    @IBOutlet weak var Hphonenumber: UILabel!
    @IBOutlet weak var Website: UITextField!
    @IBOutlet weak var Hwebsite: UILabel!
    @IBOutlet weak var Hours: UITextField!
    @IBOutlet weak var Hhours: UILabel!
    @IBOutlet weak var Picture: UITextField!
    @IBOutlet weak var Hpicture: UILabel!
   
    
    //Retourner à la page des restaurants
    @IBAction func BackRestaurant(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    @IBAction func SafariPicture(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.google.com")!)
        present(vc, animated: true)
    }
    @IBAction func SafariWebsite(_ sender: Any) {
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
        
        let gradeImage = UIImage(named:"grade")
        addLeftImageTo(txtField: Grade, andImage: gradeImage!)
        
        let LocalizationImage = UIImage(named:"localization")
        addLeftImageTo(txtField: Localization, andImage: LocalizationImage!)
        
        let phoneImage = UIImage(named:"phone")
        addLeftImageTo(txtField: PhoneNumber, andImage: phoneImage!)
        
        let hoursImage = UIImage(named:"hours")
        addLeftImageTo(txtField: Hours, andImage: hoursImage!)
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
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
        if (Grade.text?.count == 0){
            Hgrade.text = "Please enter a grade"
        }else{
            Hgrade.text = ""
        }
        if (Localization.text?.count == 0){
            Hlocalization.text = "Please enter your localization"
        }else{
            Hlocalization.text = ""
        }
        if (PhoneNumber.text?.count == 0){
            Hphonenumber.text = "Please enter your phone number"
        }else{
            Hphonenumber.text = ""
        }
        if (Website.text?.count == 0){
            Hwebsite.text = "Please enter your website"
        }else{
            Hwebsite.text = ""
        }
        if (Hours.text?.count == 0){
            Hhours.text = "Please enter your hours"
        }else{
            Hhours.text = ""
        }
        if (Picture.text?.count == 0){
            Hpicture.text = "Please enter picture"
        }else{
            Hpicture.text = ""
        }
    }
    
    //Renvoie à la page d'accueil
    func GoToHome(){
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Création d'une alerte
    private func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "The restaurant could not be created. Please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Appel de la route de l'api pour la création du restaurant
    @IBAction func Add(_ sender: Any) {
        let myUrl: URL = URL(string: "http://127.0.0.1:8000/api/restaurants")!
        var myRequest: URLRequest = URLRequest(url: myUrl);
        myRequest.httpMethod = "POST";
        
        //Vérification des champs
        verifisempty()
        
        //Récupérarion des paramètres dans les textfields
        let postString = "name=\(Name.text!)&& description=\(Description.text!)&&grade=\(Grade.text!)&&localization=\(Localization.text!)&&phone_number=\(PhoneNumber.text!)&&website=\(Website.text!)&&hours=\(Hours.text!)&&picture=\(Picture.text!)"
        myRequest.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: myRequest) { [self]data, response, error in
            let json: String = String(data: data!, encoding: .utf8)!
            print(json)
            let statusCode = (response as! HTTPURLResponse).statusCode;
            if(statusCode == 201){
                DispatchQueue.main.async {
                    //Si tout c'est bien passé retour au menu
                    GoToHome()
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
