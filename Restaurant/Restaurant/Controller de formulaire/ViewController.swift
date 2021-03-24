//
//  ViewController.swift
//  Restaurant
//
//  Created by Anaïs Puig on 10/03/2021.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var hiddentext: UILabel!
    @IBOutlet weak var hiddentext2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: email, andImage: emailImage!)
        
        
        let passwordImage = UIImage(named:"password")
        addLeftImageTo(txtField: password, andImage: passwordImage!)

    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
        let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
    //Donction pour acceder au menu sans s'authentifier
    @IBAction func NoAccount(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "NoAccountHome")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    
    //Fonction pour envoyer sur la page register
    @IBAction func SignUp(_ sender: Any) {
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SignUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
        
    }
    
    //Envoie au menu
    func GoToHome(){
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "account")
        vc.modalPresentationStyle = .overFullScreen
        //view.window?.makeKeyAndVisible()
        present(vc, animated: true)
    }
    
    //Vérification de la saisie
    @objc func verifisempty() {
        if (email.text?.count == 0){
            hiddentext.isHidden = false
            hiddentext.text = "Please enter your Email"
        }else{
            hiddentext.text = ""
        }
        if (password.text?.count ?? 0<=5){
            hiddentext2.isHidden = false
            hiddentext2.text = "Enter more than 6 characters"
        }else{
            hiddentext2.text = ""
        }
    }
    
    //Création de l'alerte
    private func presentAlert() {
        let alert = UIAlertController(title: "Error", message: "The information entered are invalid. Please try again", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func SignIn(_ sender: Any) {
        let myUrl: URL = URL(string: "http://127.0.0.1:8000/api/auth")!
        var myRequest: URLRequest = URLRequest(url: myUrl);
        myRequest.httpMethod = "POST";
        
        //Vérification des champs
        verifisempty()
        
        //Récupérarion des paramètres
        let postString = "email=\(email.text!)&password=\(password.text!)"
        myRequest.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: myRequest) { [self]data, response, error in
            let json: String = String(data: data!, encoding: .utf8)!
            
            //verification des status code
            let statusCode = (response as! HTTPURLResponse).statusCode;
            if(statusCode == 200){
                DispatchQueue.main.async {
                    //Si tout est bon accès à la page d'accueil
                    GoToHome()
                }
            }else {
                DispatchQueue.main.async {
                    //Si mauvaises informations apparition de l'alerte
                    presentAlert()
                }
            }
        }
        task.resume()
    }
}


