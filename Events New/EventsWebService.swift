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
        
        var request = URLRequest(url: <#T##URL#>)
        request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
        request.httpMethod = <#String GET or POST#>
        request.timeoutInterval = <#Int#>
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            // Error
            if let error = error {
                DispatchQueue.main.async {
                    // Completion
                    <#code#>
                }
            }
                
                // Un Authorised
            else if let response = response as? HTTPURLResponse,
                response.statusCode == 401 {
                //Authorization Error
                <#code#>
            }
                
                // Proper response
            else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        // Convert to Model Object
                        <#code#>
                    } else {
                        // Parsing Error
                        DispatchQueue.main.async {
                            <#code#>
                        }
                    }
                } catch {
                    // Error parsing JSON
                    DispatchQueue.main.async {
                        <#code#>
                    }
                }
            }
        }
        task.resume()
    }
}
