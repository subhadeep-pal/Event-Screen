//
//  GuestListViewController.swift
//  Events New
//
//  Created by Subhadeep Pal on 16/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class GuestListViewController: DetailViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (detailViewModel.numberOfGuests() + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == detailViewModel.numberOfGuests() {
            let cell = tableView.dequeueReusableCell(withIdentifier: "guestListBlankCell", for: indexPath)
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "guestListCell", for: indexPath) as! GuestListTableViewCell
            
            cell.nameLabel.text = detailViewModel.nameForGuest(index: indexPath.row)
            cell.descriptionLabel.text = detailViewModel.descriptionStringForGuest(at: indexPath.row)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == detailViewModel.numberOfGuests() {
            return 72
        }
        return 60
    }
    
}
