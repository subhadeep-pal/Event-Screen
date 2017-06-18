//
//  EventDetailViewModel.swift
//  Events New
//
//  Created by 01HW934413 on 16/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class EventDetailViewModel: NSObject {
    
    private var event: Event!
    
    init(event: Event) {
        self.event = event
    }

    var isSoldOut: Bool {
        return event.isSoldOut
    }
    
    func eventName() -> String {
        return event.name
    }
    
    func eventDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, dd MMMM"
        return dateFormatter.string(from: event.startDate)
    }
    
    func eventTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return "\(dateFormatter.string(from: event.startDate)) - \(dateFormatter.string(from: event.endDate))"
    }
    
    func isEventBooked() -> Bool {
        return event.isbooked
    }
    
    func getEvent() -> Event {
        return event
    }
    
    func textForSharing() -> String {
        return "Text for sharing"
    }
}
