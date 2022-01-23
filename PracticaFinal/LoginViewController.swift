//
//  LoginViewController.swift
//  PracticaFinal
//
//  Created by mcremote06 on 03/01/2022.
//  Copyright © 2022 mcremote06. All rights reserved.
//

import UIKit
import SwiftUI
import Firebase
import FirebaseAnalytics
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {


    @IBOutlet weak var loginStackView: UIStackView!
    @IBOutlet weak var emailtf: UITextField!
    @IBOutlet weak var passwordtf: UITextField!
    @IBOutlet weak var registrarbt: UIButton!
    @IBOutlet weak var accederbt: UIButton!
    @IBOutlet weak var googleBt: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login"
        
        //Comprobar la sesion del usuario
        let defaults = UserDefaults.standard
        if let email = defaults.value(forKey: "email") as? String,
            let proveedor = defaults.value(forKey: "proveedor") as? String {
            
            loginStackView.isHidden = true
            
            
            //navigationController?
                //.pushViewController(HomeViewController (email: email, proveedor: //ProveedorType.init(rawValue: proveedor)!), animated: false)
            
            
            self.navigationController?
                .pushViewController(RestaurantListingTableViewController(), animated: true)
            
        }
                
    }

    @IBAction func registrarBtAction(_ sender: Any) {
        
        if let email = emailtf.text, let password = passwordtf.text {
            
            Auth.auth().createUser(withEmail: email, password: password) {
                (result, error) in
                
                if let result = result, error == nil {
                    
                   
                    //self.navigationController?
                        //.pushViewController(HomeViewController (email: //result.user.email!, proveedor: .basic), animated: true)
                    self.navigationController?
                    .pushViewController(RestaurantListingTableViewController(), animated: true)
                    
                }else{
                    
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un erro al registrar el usuario" , preferredStyle:  .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loginStackView.isHidden = false
    }
    
    @IBAction func accederBtAction(_ sender: Any) {
        
        if let email = emailtf.text, let password = passwordtf.text {
            
            Auth.auth().signIn(withEmail: email, password: password) {
                (result, error) in
                
                if let result = result, error == nil {
                    
                    //self.navigationController?
                        //.pushViewController(HomeViewController (email: //result.user.email!, proveedor: .basic), animated: true)
                    self.navigationController?
                    .pushViewController(RestaurantListingTableViewController(), animated: true)
                    
                }else{
                    
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un erro al registrar el usuario" , preferredStyle:  .alert)
                    
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }

    }
    
    private func showHome(result: AuthDataResult?, error: Error?, proveedor: ProveedorType){
        
        if let result = result, error == nil {
            
            self.navigationController?
                .pushViewController(HomeViewController (email: result.user.email!, proveedor: proveedor), animated: true)
            
        }else{
            
            let alertController = UIAlertController(title: "Error", message: "Se ha producido un error al registrar el usuario" , preferredStyle:  .alert)
            
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func googleBtAction(_ sender: Any) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) {
           
            user, error in

            if let error = error {
                print(error.localizedDescription)
              return
            }

            guard
              let authentication = user?.authentication,
              let idToken = authentication.idToken
            else {
              return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)

            Auth.auth().signIn(with: credential) {
                result, error in

                if let error = error {
                    print(error.localizedDescription)
                  return
                }
                
                self.showHome(result: result, error: error, proveedor: .google)
            }
        }
    }
    
    
}
