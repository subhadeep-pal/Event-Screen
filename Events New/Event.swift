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
    
    var id : Int?
    var title : String?
    var desc : String?
    var summary : String?
    var venue : String?
    var image_url : String?
    var conducted_by : String?
    var vacancy_status : String?
    var fee : Int?
    var bookmarked_member_attendance_count : Int?
    var member_purchase_status : String?
    var date_and_time : String?
    var city : String?
    var location : String?
    var dress_code : String?
    var host_name : String?
    var host_phone : String?
    var location_marker : String?
    var instructions : String?
    var full_address : String?
    var instructions_as_html : String?
    var disclaimer_as_html : String?
    
    var startDate : Date? {
        if let dateString = date_and_time {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss'.000'ZZZZZ"
            return dateFormatter.date(from: dateString)
        }
        return nil
    }
    
    
    var isSoldOut : Bool {
        if let member_purchase_status = member_purchase_status,
            member_purchase_status == "sold_out" {
            return true
        }
        return false
    }
    
    required public init?(dictionary: [String:Any]) {
        
        id = dictionary["id"] as? Int
        title = dictionary["title"] as? String
        desc = dictionary["description"] as? String
        summary = dictionary["summary"] as? String
        venue = dictionary["venue"] as? String
        image_url = dictionary["image_url"] as? String
        conducted_by = dictionary["conducted_by"] as? String
        vacancy_status = dictionary["vacancy_status"] as? String
        fee = dictionary["fee"] as? Int
        bookmarked_member_attendance_count = dictionary["bookmarked_member_attendance_count"] as? Int
        member_purchase_status = dictionary["member_purchase_status"] as? String
        date_and_time = dictionary["date_and_time"] as? String
        city = dictionary["city"] as? String
        location = dictionary["location"] as? String
        dress_code = dictionary["dress_code"] as? String
        host_name = dictionary["host_name"] as? String
        host_phone = dictionary["host_phone"] as? String
        location_marker = dictionary["location_marker"] as? String
        instructions = dictionary["instructions"] as? String
        full_address = dictionary["full_address"] as? String
        instructions_as_html = dictionary["instructions_as_html"] as? String
        disclaimer_as_html = dictionary["disclaimer_as_html"] as? String
    }
    
}
