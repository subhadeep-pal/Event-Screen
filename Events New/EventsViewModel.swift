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
            Event(name: "Aero India 2017", address: "The Flying Squirrel", location: "Bengaluru", guestList: guestList, startDate: "2017-06-16 11:00:00", endDate: "2017-06-16 21:30:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: "", isBooked: true),
            Event(name: "Hot air balloon safari", address: "XYZ Street", location: "Pune", guestList: guestList, startDate: "2017-06-17 11:00:00", endDate: "2017-06-17 13:00:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: "", isSoldOut: true),
            Event(name: "For the love of coffee!", address: "The Flying Squirrel", location: "Bengaluru", guestList: guestList, startDate: "2017-08-02 19:30:00", endDate: "2017-08-02 21:30:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: ""),
            Event(name: "Aero India 2017", address: "The Flying Squirrel", location: "Bengaluru", guestList: guestList, startDate: "2017-06-15 11:00:00", endDate: "2017-06-15 21:30:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: ""),
            Event(name: "Hot air balloon safari", address: "XYZ Street", location: "Pune", guestList: guestList, startDate: "2017-12-12 11:00:00", endDate: "2017-12-12 13:00:00", dressCode: "Smart Casuals", ticketCost: 700, eventImageUrl: "", isSoldOut: true),
            
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
    
    func dateForEvent(index: Int) -> String {
        
        let startDate = events[index].startDate
        
        let calendar = Calendar.current
        if calendar.isDateInToday(startDate) {
            return "TODAY"
        } else if  calendar.isDateInTomorrow(startDate) {
            return "TOMORROW"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, d MMM"
            let dateStr = dateFormatter.string(from: startDate)
            return dateStr.uppercased()
        }
    }
    
    func locationForEvent(index: Int) -> String {
        return "\(events[index].location)".uppercased()
    }
    
    func guestAttentingDescriptionForEvent(index: Int) -> String {
        let guestList = events[index].guestList
        
        if guestList.count == 0 {
            return ""
        } else if guestList.count == 1 {
            return "\(guestList[0].firstName.capitalized) is attending"
        } else {
            return "\(guestList[0].firstName.capitalized), \(guestList[1].firstName.capitalized) and \(guestList.count - 2) others attending"
        }
    }
    
    func eventForIndex(index: Int) -> Event {
        return events[index]
    }

}
