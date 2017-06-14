//
//  Event.swift
//  Events New
//
//  Created by 01HW934413 on 13/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

public enum Location: String {
    case Delhi = "Delhi"
    case Bengaluru = "Bengaluru"
    case Mumbai = "Mumbai"
    case Pune = "Pune"
}

class Event: NSObject {
    
    let name: String
    let address: String
    let location: Location
    let guestList: [Guest]
    let startDate: Date
    let endDate: Date
    let isSoldOut: Bool
    let dressCode: String
    let ticketCost: Int
    let eventImageUrl: String
    
    init(name: String, address: String, location: String, guestList: [Guest], startDate: String, endDate: String, dressCode: String, ticketCost: Int, eventImageUrl: String, isSoldOut: Bool = false) {
        self.name = name
        self.address = address
        self.ticketCost = ticketCost
        self.dressCode = dressCode
        self.isSoldOut = isSoldOut
        self.guestList = guestList
        self.eventImageUrl = eventImageUrl
        
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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        self.startDate = dateFormatter.date(from: startDate)!
        self.endDate = dateFormatter.date(from: endDate)!
    }
}
