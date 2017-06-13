//
//  Guest.swift
//  Events New
//
//  Created by 01HW934413 on 13/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class Guest: NSObject {
    let firstName: String
    let lastName: String
    let age: Int
    let desc: String
    let location: Location
    let imageUrl: String
    
    init(firstName: String, lastName: String, desc: String, imageUrl: String, age: Int, location: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.desc = desc
        self.age = age
        switch location.lowercased() {
            case "delhi":
            self.location = .Delhi
            case "bengaluru":
            self.location = .Bengaluru
            case "mumbai":
            self.location = .Mumbai
            case "pune":
            self.location = .Pune
            default:
            self.location = .Bengaluru
        }
        self.imageUrl = imageUrl
    }
    
}
