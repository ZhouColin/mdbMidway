//
//  ViewController.swift
//  mdbMidway
//
//  Created by Colin Zhou on 2020-02-22.
//  Copyright © 2020 Colin Zhou. All rights reserved.
//

import UIKit
import Firebase


class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UIView!
    
    
    
    func handleLogin() {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        let auth = Auth.auth()
        
        auth.signIn(withEmail: email, password: password) { (user,error) in
            guard error == nil else {
                self.displayAlert(title: "Error", message: "Create User Error")
                print(error.debugDescription)
                return
            }
            guard user != nil else {
                self.displayAlert(title: "Error", message: "User error")
                return
            }
            self.performSegue(withIdentifier: "toMainFeed", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func handleLoginButton(_ sender: Any) {
        handleLogin()
    }
}

