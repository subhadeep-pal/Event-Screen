//
//  WebserviceConstants.swift
//  Events New
//
//  Created by Subhadeep Pal on 12/07/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class WebserviceConstants: NSObject {
    
    private static func valueForKey(key: String) -> Any? {
        let fileURL = Bundle.main.url(forResource: "API Endpoints", withExtension: "plist")
        let dictionary = NSDictionary(contentsOf: fileURL!)
        return dictionary?.value(forKey: key)
    }
    
    private static var endpoint : String {
        return valueForKey(key: "Endpoint") as! String
    }
    
    static var accessToken : [String] {
        let dictionary = valueForKey(key: "Access token") as! NSDictionary
        let key = dictionary.value(forKey: "key") as! String
        let value = dictionary.value(forKey: "value") as! String
        return [key,value]
    }
    
    static var APIKey : [String] {
        let dictionary = valueForKey(key: "API Key") as! NSDictionary
        let key = dictionary.value(forKey: "key") as! String
        let value = dictionary.value(forKey: "value") as! String
        return [key,value]
    }
    
    static var upcommingEventsURL : URL {
        let string = valueForKey(key: "Upcomming Events") as! String
        let urlString = "\(endpoint)\(string)"
        let url = URL(string: urlString)!
        return url
    }
    
    static func eventDetails(id: String) -> URL {
        let string = valueForKey(key: "Event Details") as! String
        let urlString = "\(endpoint)\(string)\(id)"
        let url = URL(string: urlString)!
        return url
    }
}
