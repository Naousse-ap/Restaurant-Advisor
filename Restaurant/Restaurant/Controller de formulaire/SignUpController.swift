//
//  SignUpController.swift
//  Restaurant
//
//  Created by Anaïs Puig on 10/03/2021.
//

import UIKit
import Alamofire

class SignUpController: UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Hemail: UILabel!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Hpassword: UILabel!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Husername: UILabel!
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Hname: UILabel!
    @IBOutlet weak var Firstname: UITextField!
    @IBOutlet weak var Hfirstname: UILabel!
    @IBOutlet weak var Age: UITextField!
    @IBOutlet weak var Hage: UILabel!
    
    //Icone Textfield
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: Email, andImage: emailImage!)
        
        let usernameImage = UIImage(named:"name")
        addLeftImageTo(txtField: Username, andImage: usernameImage!)
        
        let nameImage = UIImage(named:"name")
        addLeftImageTo(txtField: Name, andImage: nameImage!)
        
        let firstnameImage = UIImage(named:"name")
        addLeftImageTo(txtField: Firstname, andImage: firstnameImage!)
        
        let ageImage = UIImage(named:"age")
        addLeftImageTo(txtField: Age, andImage: ageImage!)
        
        let passwordImage = UIImage(named:"password")
        addLeftImageTo(txtField: Password, andImage: passwordImage!)

    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    //Fonction pour retoutner sur la page d'authentification
    @IBAction func GoBack(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Main")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Vérification des champs saisis
    @objc func verifisempty() {
        if (Email.text?.count == 0){
            Hemail.text = "Please enter your Email"
        }else{
            Hemail.text = ""
        }
        if (Password.text?.count ?? 0<=5){
            Hpassword.text = "Enter more than 6 characters"
        }else{
            Hpassword.text = ""
        }
        if (Username.text?.count == 0){
            Husername.text = "Please enter your Username"
        }else{
            Husername.text = ""
        }
        if (Name.text?.count == 0){
            Hname.text = "Please enter your Name"
        }else{
            Hname.text = ""
        }
        if (Firstname.text?.count == 0){
            Hfirstname.text = "Please enter your Firstname"
        }else{
            Hfirstname.text = ""
        }
        if (Age.text?.count == 0){
            Hage.text = "Please enter your Age"
        }else{
            Hage.text = ""
        }
    }
    
    //Accès à la page d'accueil
    func GoToHome(){
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    //Création de l'alerte
    private func presentAlert() {
        // create the alert
        let alert = UIAlertController(title: "Error", message: "The user account could not be created. Please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func Register(_ sender: Any) {
        
        let myUrl: URL = URL(string: "http://127.0.0.1:8000/api/register")!
        var myRequest: URLRequest = URLRequest(url: myUrl);
        myRequest.httpMethod = "POST";
        
        //Vérification des champs
        verifisempty()
        
        //Récupérarion des paramètres
        let postString = "username=\(Username.text!)&& password=\(Password.text!)&&email=\(Email.text!)&&name=\(Name.text!)&&firstname=\(Firstname.text!)&&age=\(Age.text!)"
        myRequest.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: myRequest) { [self]data, response, error in
            
            //vérification des status code
            let statusCode = (response as! HTTPURLResponse).statusCode;
            if(statusCode == 201){
                DispatchQueue.main.async {
                    //Quand c'est bon redirection sur la page d'accueil
                    GoToHome()
                }
            }else {
                DispatchQueue.main.async {
                    //Autrement affichage de l'alerte
                    presentAlert()
                }
                
            }
        }
        task.resume()
    }
}

