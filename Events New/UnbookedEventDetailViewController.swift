//
//  UnbookedEventDetailViewController.swift
//  Events New
//
//  Created by Subhadeep Pal on 16/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class UnbookedEventDetailViewController: DetailViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dresscodeLabel: UILabel!
    @IBOutlet weak var ticketCostLabel: UILabel!
    
    private var isDescriptionExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        locationLabel.text = detailViewModel.address
        dresscodeLabel.text = detailViewModel.dressCode
        ticketCostLabel.text = detailViewModel.ticketCost
        descriptionLabel.text = detailViewModel.eventDescription
    }
    
    
    @IBAction func readMoreTapped(_ sender: UIButton) {
        if !isDescriptionExpanded {
            sender.setTitle("less ...", for: .normal)
            descriptionLabel.numberOfLines = 0
            isDescriptionExpanded = true
        } else {
            sender.setTitle("read more", for: .normal)
            descriptionLabel.numberOfLines = 3
            isDescriptionExpanded = false
        }
        
    }
    @IBAction func locationButtonTapped(_ sender: UIButton) {
        // GOOGLE MAPS
        // Marker with name : https://www.google.com/maps/search/?api=1&query=centurylink+field
        // Marker with name : https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393&query_place_id=ChIJKxjxuaNqkFQR3CK6O1HNNqY
        // Marker with no name : https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393
        
        
        // Apple Maps
        // Marker & Name : http://maps.apple.com/?q=47.5951518,-122.3316393
        
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
                UIApplication.shared.openURL(URL(string:"https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393")!)
            } else {
                UIApplication.shared.openURL(URL(string: "http://maps.apple.com/?q=47.5951518,-122.3316393")!)
        }
    }

}
