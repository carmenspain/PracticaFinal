//
//  HomeViewController.swift
//  PracticaFinal
//
//  Created by mcremote06 on 21/01/2022.
//  Copyright © 2022 mcremote06. All rights reserved.
//

import UIKit

enum ProveedorType: String {
    case basic
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
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func cerrarSesionBtAction(_ sender: Any) {
    }
}
