//
//  HomeViewController.swift
//  PracticaFinal
//
//  Created by mcremote06 on 21/01/2022.
//  Copyright © 2022 mcremote06. All rights reserved.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

enum ProveedorType: String {
    case basic
    case google
}

class HomeViewController: UIViewController {

    @IBOutlet weak var emailLb: UILabel!
    @IBOutlet weak var proveedorLb: UILabel!
    @IBOutlet weak var cerrarSesionBt: UIButton!
    
    private let email: String
    private let proveedor: ProveedorType
    
    init(email: String, proveedor: ProveedorType){
        self.email = email
        self.proveedor = proveedor
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has noot been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Inicio"
        
        navigationItem.setHidesBackButton(true, animated: false)
        
        emailLb.text = email
        proveedorLb.text = proveedor.rawValue
        
        //Vamos a guardar los datos de los usuarios
        
        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        defaults.set(proveedor.rawValue, forKey: "proveedor")
        defaults.synchronize()
    }
    

    @IBAction func cerrarSesionBtAction(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "email")
        defaults.removeObject(forKey: "proveedor")
        defaults.synchronize()
        
        switch proveedor {
        case .basic, .google:
            
            do{
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            }catch {
                //Se ha producido un error
            }
            
        }
    }
}
