//
//  EventsWebService.swift
//  Events New
//
//  Created by 01HW934413 on 03/07/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class EventsWebService: NSObject {
    
    func fetchEvents(completion: @escaping (_ success: Bool, _ error: String?, _ events: [Event]?)->Void) {
        // Configuration
        let session = URLSession(configuration: .default)
        
        var request = URLRequest(url: WebserviceConstants.upcommingEventsURL)
        request.setValue(WebserviceConstants.APIKey[1], forHTTPHeaderField: WebserviceConstants.APIKey[0])
        request.setValue(WebserviceConstants.accessToken[1], forHTTPHeaderField: WebserviceConstants.accessToken[0])
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // Error
            if let error = error {
                DispatchQueue.main.async {
                    // Completion
                    print("\(error.localizedDescription)")
                }
            }
                
                // Un Authorised
            else if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                //Authorization Error
                print("Unauthorised")
            }
                
                // Proper response
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any],
                    let eventsArray = json["events_upcoming"] as? [[String:Any]]
                    {
                        // Convert to Model Object
                        var events = [Event]()
                        for dictionary in eventsArray {
                            let event = Event()
                            event.id = dictionary["id"] != nil ? dictionary["id"] as! Int : 0
                            event.title = dictionary["title"] as? String
                            event.desc = dictionary["description"] as? String
                            event.summary = dictionary["summary"] as? String
                            event.venue = dictionary["venue"] as? String
                            event.image_url = dictionary["image_url"] as? String
                            event.conducted_by = dictionary["conducted_by"] as? String
                            event.vacancy_status = dictionary["vacancy_status"] as? String
                            event.fee = dictionary["fee"] as? String
                            event.bookmarked_member_attendance_count = dictionary["bookmarked_member_attendance_count"] != nil ?dictionary["bookmarked_member_attendance_count"] as! Int : 0
                            event.member_purchase_status = dictionary["member_purchase_status"] as? String
                            event.date_and_time = dictionary["date_and_time"] as? String
                            event.city = dictionary["city"] as? String
                            event.location = dictionary["location"] as? String
                            event.dress_code = dictionary["dress_code"] as? String
                            event.host_name = dictionary["host_name"] as? String
                            event.host_phone = dictionary["host_phone"] as? String
                            event.location_marker = dictionary["location_marker"] as? String
                            event.instructions = dictionary["instructions"] as? String
                            event.full_address = dictionary["full_address"] as? String
                            event.instructions_as_html = dictionary["instructions_as_html"] as? String
                            event.disclaimer_as_html = dictionary["disclaimer_as_html"] as? String
                            events.append(event)
                        }
                        DispatchQueue.main.async {
                            completion(true, nil, events)
                        }
                    } else {
                        // Parsing Error
                        DispatchQueue.main.async {
                            print("Parsing Error")
                        }
                    }
                } catch {
                    // Error parsing JSON
                    DispatchQueue.main.async {
                        print("Parsing Error")
                    }
                }
            }
        }
        task.resume()
    }
}
