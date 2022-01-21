//
//  LoginViewController.swift
//  PracticaFinal
//
//  Created by mcremote06 on 03/01/2022.
//  Copyright © 2022 mcremote06. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var passwordtf: UITextField!
    @IBOutlet weak var registrarbt: UIButton!
    @IBOutlet weak var accederbt: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        
    }

    @IBAction func registrarBtAction(_ sender: Any) {
        
        if let email = emailtf.text, let password = passwordtf.text {
            
            Auth.auth().createUser(withEmail: email, password: password) {
                (result, error) in
                
                if let result = result, error == nil {
                    
                    self.navigationController?
                        .pushViewController(HomeViewController (email: result.user.email!, proveedor: .basic), animated: true)
                    
                }else{
                    
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un erro al registrar el usuario" , preferredStyle:  .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
    }
    @IBAction func accederBtAction(_ sender: Any) {
    }
}


