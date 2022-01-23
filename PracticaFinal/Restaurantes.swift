//
//  Restaurantes.swift
//  PracticaFinal
//
//  Created by mcremote06 on 23/01/2022.
//  Copyright © 2022 mcremote06. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Restaurantes
{
    var restaurantes: [Restaurant] = []
    var db : Firestore!
    
    init() {
        restaurantes = [Restaurant]()
        db = Firestore.firestore()
    }
  
    func cargarDatos(completed: @escaping() -> ()){
        db.collection("restaurantes").getDocuments(){
            querySnapshot, error in
            
            guard error == nil else {
                print(error?.localizedDescription as Any)
                return completed()
            }
        
            self.restaurantes = []
            
            for document in querySnapshot!.documents{
                let restaurant = Restaurant(dictionary: document.data())
                restaurant.id = document.documentID
                self.restaurantes.append(restaurant)
            }
            
            completed()
        }
    }
    
}
