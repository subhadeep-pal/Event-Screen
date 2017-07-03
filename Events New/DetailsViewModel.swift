//
//  DetailsViewModel.swift
//  Events New
//
//  Created by 01HW934413 on 16/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class DetailsViewModel: NSObject {
    
    private let event : Event
    
    var address : String {
//        return "\(event.address), \(event.location)".capitalized
        return ""
    }
    
    var ticketCost : String {
//        return "₹\(event.ticketCost)"
        return ""
    }
    
    var dressCode : String {
//        return event.dressCode.capitalized
        return ""
    }
    
    var eventDescription: String {
//        return event.eventDescription
        return ""
    }
    
    var hostName : String {
//        return event.hostName.capitalized
        return ""
    }
    
    var hostPhoneNumber : String {
//        return event.hostPhoneNumber
        return ""
    }
    
    init(event: Event) {
        self.event = event
    }
    
    
    func numberOfGuests() -> Int {
//        return event.guestList.count
        return 0
    }
    
    func nameForGuest(index: Int) -> String {
//        return "\(event.guestList[index].firstName) \(event.guestList[index].lastName)".capitalized
        return ""
    }
    
    func descriptionStringForGuest(at index: Int) -> String {
//        return "\(event.guestList[index].age), \(event.guestList[index].desc) from \(event.guestList[index].location)"
        return ""
    }
    
}
