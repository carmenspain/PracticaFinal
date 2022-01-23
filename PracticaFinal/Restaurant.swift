//
//  Restaurant.swift
//  Foodsie
//
//  Created by Cons Bulaqueña on 26/06/2018.
//  Copyright © 2018 consios. All rights reserved.
//

import Foundation
import Firebase


class Restaurant
{
    var id: String?
    var name: String?
    var address: String?
    var logoURL: String?
    var phone: String?
    var cuisine: String?
    
    init(dictionary: [String: Any ]){
        self.name = dictionary["name"] as! String ?? " "
        self.address = dictionary["adress"] as! String ?? " "
        self.logoURL = dictionary["logoURL"] as! String ?? " "
        self.phone = dictionary["phone"] as! String ?? " "
        self.cuisine = dictionary["cuisine"] as! String ?? " "
    }
}
