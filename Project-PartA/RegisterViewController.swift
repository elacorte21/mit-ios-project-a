//
//  ViewController.swift
//  UserDefaultDemo
//
//  Created by Eddril Lacorte on 23/10/20.
//  Copyright © 2020 EL. All rights reserved.
//

import UIKit

// Global Function

// Popup
func showMessage(msg: String, controller: UIViewController) {
    let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    controller.present(alert, animated: true, completion: nil)
}

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var addressTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Create an Account"
    }
    
    @IBAction func regBtn(_ sender: UIButton) {
        let uname = usernameTxt.text!
        let pwd = passwordTxt.text!
        let name = nameTxt.text!
        let email = emailTxt.text!
        let address = addressTxt.text!
        let phone = phoneTxt.text!
        
        if name.isEmpty {
            showMessage(msg: "Please enter your name", controller: self)
        } else if email.isEmpty {
            showMessage(msg: "Please enter your email", controller: self)
        } else if uname.isEmpty {
            showMessage(msg: "Please enter your username", controller: self)
        } else if pwd.isEmpty {
            showMessage(msg: "Please enter your password", controller: self)
        } else {
            UserDefaults.standard.set(uname, forKey: "username")
            UserDefaults.standard.set(pwd, forKey: "password")
            performSegue(withIdentifier: "showLoginView", sender: self)
        }
        
        //Clear data
        //UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        //UserDefaults.standard.synchronize()
    }
    
}

