//
//  EventsViewModel.swift
//  Events New
//
//  Created by 01HW934413 on 13/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class EventsViewModel: NSObject {
    
    private var events: [Event] = []
    
    override init() {
        
        let guestList = [
            Guest(firstName: "Schubert", lastName: "Cardozo", desc: "Musician", imageUrl: "", age: 33, location: "Mumbai"),
            Guest(firstName: "Siddharth", lastName: "Mangharam", desc: "Floh Co-Founder", imageUrl: "", age: 33, location: "Bengaluru"),
            Guest(firstName: "Divya", lastName: "Kunnath", desc: "Floh Member", imageUrl: "", age: 29, location: "Pune"),
            Guest(firstName: "Snehal", lastName: "Kumar", desc: "Floh Member", imageUrl: "", age: 26, location: "Bengaluru"),
            Guest(firstName: "Subhadeep", lastName: "Pal", desc: "iOS Developer", imageUrl: "", age: 24, location: "Bengaluru"),
            Guest(firstName: "Bill", lastName: "Gates", desc: "Billionare", imageUrl: "", age: 64, location: "Pune"),
            Guest(firstName: "Mark", lastName: "Zukerburg", desc: "Social Activist", imageUrl: "", age: 32, location: "Delhi")]
        
        events = [
            Event(name: "For the love of coffee!", address: "The Flying Squirrel", location: "Bengaluru", guestList: guestList, startDate: "2017-07-29 19:30:00", endDate: "2017-07-29 21:30:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: ""),
            Event(name: "Aero India 2017", address: "The Flying Squirrel", location: "Bengaluru", guestList: guestList, startDate: "2017-06-14 11:00:00", endDate: "2017-06-14 21:30:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: ""),
            Event(name: "Hot air balloon safari", address: "XYZ Street", location: "Pune", guestList: guestList, startDate: "2017-06-12 11:00:00", endDate: "2017-06-12 13:00:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: "", isSoldOut: true),
            Event(name: "For the love of coffee!", address: "The Flying Squirrel", location: "Bengaluru", guestList: guestList, startDate: "2017-07-29 19:30:00", endDate: "2017-07-29 21:30:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: ""),
            Event(name: "Aero India 2017", address: "The Flying Squirrel", location: "Bengaluru", guestList: guestList, startDate: "2017-06-14 11:00:00", endDate: "2017-06-14 21:30:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: ""),
            Event(name: "Hot air balloon safari", address: "XYZ Street", location: "Pune", guestList: guestList, startDate: "2017-06-12 11:00:00", endDate: "2017-06-12 13:00:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: "", isSoldOut: true),
            
        ]
        
    }
    
    
    func numberOfEvents() -> Int {
            return events.count
    }
    
    func nameForEvent(index: Int) -> String {
        return events[index].name.uppercased()
    }
    
    func timeForEvent(index: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: events[index].startDate)
    }
    
    func locationForEvent(index: Int) -> String {
        return "\(events[index].location)".uppercased()
    }

}