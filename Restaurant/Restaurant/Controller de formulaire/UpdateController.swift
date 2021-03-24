//
//  test.swift
//  Restaurant
//
//  Created by Anaïs Puig on 16/03/2021.
//

import UIKit
import Alamofire
import SafariServices

class UpdateController: UIViewController {
    
    
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var Grade: UITextField!
    @IBOutlet weak var Localization: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Website: UITextField!
    @IBOutlet weak var Hours: UITextField!
    @IBOutlet weak var Picture: UITextField!

    @IBOutlet weak var Hname: UILabel!
    @IBOutlet weak var Hdescription: UILabel!
    @IBOutlet weak var Hgrade: UILabel!
    @IBOutlet weak var hLocalization: UILabel!
    @IBOutlet weak var Hphone: UILabel!
    @IBOutlet weak var Hwebsite: UILabel!
    @IBOutlet weak var Hhours: UILabel!
    @IBOutlet weak var Hpicture: UILabel!
  
    
   
    //Définition d'une variable vide, en attente du passage de l'id du restaurant à mettre à jour grâce au segue
    var getid:String = ""
    
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
        
        let phoneImage = UIImage(named:"phone")
        addLeftImageTo(txtField: Phone, andImage: phoneImage!)
        
        let hoursImage = UIImage(named:"hours")
        addLeftImageTo(txtField: Hours, andImage: hoursImage!)
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    @IBAction func SafariLocalization(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.google.com")!)
        present(vc, animated: true)
    }
    @IBAction func SafariWebsite(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.google.com")!)
        present(vc, animated: true)
    }
    @IBAction func SafariPicture(_ sender: Any) {
        let vc = SFSafariViewController(url: URL(string: "https://www.google.com")!)
        present(vc, animated: true)
    }
    
    //Création de l'alerte signalant que le restaurant n'a pas été mis à jour
    private func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "The restaurant could not be updated. Please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    //Fonction permettant de vérifier que tous les champs ont été remplis
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
            hLocalization.text = "Please enter your localization"
        }else{
            hLocalization.text = ""
        }
        if (Phone.text?.count == 0){
            Hphone.text = "Please enter your phone number"
        }else{
            Hphone.text = ""
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
    
    //Fonction permettant de revenir à la page d'accueil des restaurants une fois le formulaire rempli et validé
    func GoToRestaurant(){
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Fonction définie dans le bouton pour envoyer le formulaire à la route update de-es restaurants
    @IBAction func upd(_ sender: Any) {
        verifisempty()
        let parameters :[String: Any]  = ["name": Name.text!,"description": Description.text!,"grade": Grade.text!,"localization": Localization.text!,"phone_number": Phone.text!,"website": Website.text!, "hours": Hours.text!,"picture": Picture.text!]
        Alamofire.request(URL(string: "http://127.0.0.1:8000/api/restaurant/\(getid)")!, method: .put, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil).responseJSON { (response) in
            
            if response.response!.statusCode == 200 {
                self.GoToRestaurant()
            } else {
               
                self.presentAlert()
            }
        }
    }
}

