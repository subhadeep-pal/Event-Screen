//
//  EventsViewModel.swift
//  Events New
//
//  Created by 01HW934413 on 13/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit
import RealmSwift

class EventsViewModel: NSObject {
    
    @IBOutlet weak var webService: EventsWebService!
    
    private var events: Results<Event>
    
    private var guestList : [Guest] = []
    
    private var realm : Realm!
    
    override init() {
        
        guestList = [
            Guest(firstName: "Schubert", lastName: "Cardozo", desc: "Musician", imageUrl: "", age: 33, location: "Mumbai"),
            Guest(firstName: "Siddharth", lastName: "Mangharam", desc: "Floh Co-Founder", imageUrl: "", age: 33, location: "Bengaluru"),
            Guest(firstName: "Divya", lastName: "Kunnath", desc: "Floh Member", imageUrl: "", age: 29, location: "Pune"),
            Guest(firstName: "Snehal", lastName: "Kumar", desc: "Floh Member", imageUrl: "", age: 26, location: "Bengaluru"),
            Guest(firstName: "Subhadeep", lastName: "Pal", desc: "iOS Developer", imageUrl: "", age: 24, location: "Bengaluru"),
            Guest(firstName: "Bill", lastName: "Gates", desc: "Billionare", imageUrl: "", age: 64, location: "Pune"),
            Guest(firstName: "Mark", lastName: "Zukerburg", desc: "Social Activist", imageUrl: "", age: 32, location: "Delhi")]
        

        
//        let event = Event()
//        
//        event.city = "Bengaluru"
//        event.conducted_by = "Subhadeep Pal"
//        event.date_and_time = "2017-07-07T18:00:00.000+05:30"
//        event.location = "Indiranagar"
//        event.dress_code = "Smart Casuals"
//        event.title = "Takes Two To Tango!"
//        event.id = 549
//        event.desc = "Ready for an andrenalin rush? Ladies and Gentlemen, presenting to you an evening of Tango! \nThere's nothing quite like Latin dance forms and Tango easily makes it to the top of that list. So if you've got the moves or want to hone your skills or just shake a leg (or two), join Floh members because it 'Takes Two to Tango'! If you have never danced before, even better! On Saturday, the weekend of 3rd September, 2016, let the great people of 'Bangalore Argentine Tango' up your twinkle-toes game. :)\nWhat are you waiting for? Sign up before those limited spots 'Tango' away! "
//        event.venue = "Vibes - The Dance Lab"
//        event.image_url = "https://floh-prestaging-uploads.s3-ap-south-1.amazonaws.com/event/549/cover_photo/large-f70f1410702dcbe40c061eaeb807a55f.png"
//        event.member_purchase_status = "Sold out"
        
        realm = try! Realm()
//        realm.beginWrite()
//        realm.deleteAll()
//        try! realm.commitWrite()
        
        
        events = realm.objects(Event.self)
        
    }
    func fetchEvents(successCallback: @escaping ()->Void, failourCallback: @escaping (_ error: String) -> Void) {
        webService.fetchEvents { (success, error, events) in
            if success,
                let events = events{
                self.realm.beginWrite()
                self.realm.add(events)
                try! self.realm.commitWrite()
                self.retrieveObjects(filterCity: nil)
                successCallback()
            } else {
                failourCallback(error!)
            }
        }
    }
    
    func retrieveObjects(filterCity: String?) {
        if let filter = filterCity {
            events = realm.objects(Event.self).filter(NSPredicate(format: "city contains '\(filter)'"))
        } else {
            events = realm.objects(Event.self)
        }
        
    }
    
    func numberOfEvents() -> Int {
            return events.count
    }
    
    func nameForEvent(index: Int) -> String {
        if let title = events[index].title {
            return title.uppercased()
        }
        return ""
    }
    
    func timeForEvent(index: Int) -> String {
        if let startDate = events[index].startDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mm a"
            return dateFormatter.string(from: startDate)
        }
        return ""
    }
    
    func dateForEvent(index: Int) -> String {
        
        if let startDate = events[index].startDate {
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
        return ""
    }
    
    
    func locationForEvent(index: Int) -> String {
        if let location = events[index].city {
            return location.uppercased()
        }
        return "Bengaluru"
    }
    
    func guestAttentingDescriptionForEvent(index: Int) -> String {
        
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
    
    func isEventSoldOut(index: Int) -> Bool {
       return events[index].isSoldOut
    }

}
