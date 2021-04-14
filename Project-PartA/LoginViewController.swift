//
//  LoginViewController.swift
//  UserDefaultDemo
//
//  Created by Eddril Lacorte on 23/10/20.
//  Copyright © 2020 EL. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var logo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logo rounded corners
        logo.layer.cornerRadius = logo.layer.bounds.height / 2
        logo.clipsToBounds = true
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        let uname = usernameTxt.text!
        let pwd = passwordTxt.text!
        //read username and pass from userdefaults
        let username = UserDefaults.standard.value(forKey: "username") as! String
        let password = UserDefaults.standard.value(forKey: "password") as! String
        if uname == username && pwd == password {
            performSegue(withIdentifier: "showLoggedInView", sender: self)
        } else {
            showMessage(msg: "Sorry please try again", controller: self)
        }
    }
}
