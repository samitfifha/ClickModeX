//
//  LoginViewController.swift
//  Cickmode1
//
//  Created by Apple Esprit on 23/11/2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var email:String?
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTF.text = email
        
    }
    @IBAction func logInBtn(_ sender: Any) {
        if(emailTF.text!.isEmpty || passwordTF.text!.isEmpty){
            self.present(Alert.makeAlert(titre: "Avertissement", message: "Vous devez taper vos identifiants"), animated: true)
            return
        }
        
        
        guard let email = self.emailTF.text else{return}
        guard let password = self.passwordTF.text else{return}
        //let admin = adminModel(email: email, motdepasse: motdepasse)
        if(self.emailTF.text!.isEmpty || self.passwordTF.text!.isEmpty){
            self.present(Alert.makeAlert(titre: "Avertissement", message: "Vous devez taper vos identifiants"), animated: true)
            return
        }
        
        Apicalls.shareInstence.login(email: email, password: password){
            (isSuccess) in
            if isSuccess{
                //self.present(Alert.makeAlert(titre: "Alert", message: "User register successfully"), animated: true)
                self.performSegue(withIdentifier: "home", sender: nil)
            } else {
                self.present(Alert.makeAlert(titre: "Alert", message: "Please try again successfully"), animated: true)
            }
        }


    }

    

}
