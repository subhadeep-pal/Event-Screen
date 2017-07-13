//
//  Event.swift
//  Events New
//
//  Created by 01HW934413 on 13/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit
import RealmSwift

public enum Location: String {
    case Delhi = "Delhi"
    case Bengaluru = "Bengaluru"
    case Mumbai = "Mumbai"
    case Pune = "Pune"
}

class Event: Object {
    
    dynamic var id : Int = 0
    dynamic var title : String?
    dynamic var desc : String?
    dynamic var summary : String?
    dynamic var venue : String?
    dynamic var image_url : String?
    dynamic var conducted_by : String?
    dynamic var vacancy_status : String?
    dynamic var fee : String?
    dynamic var bookmarked_member_attendance_count : Int = 0
    dynamic var member_purchase_status : String?
    dynamic var date_and_time : String?
    dynamic var city : String?
    dynamic var location : String?
    dynamic var dress_code : String?
    dynamic var host_name : String?
    dynamic var host_phone : String?
    dynamic var location_marker : String?
    dynamic var instructions : String?
    dynamic var full_address : String?
    dynamic var instructions_as_html : String?
    dynamic var disclaimer_as_html : String?
    
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
    
}
