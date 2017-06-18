//
//  EventTableViewCell.swift
//  Events New
//
//  Created by 01HW934413 on 13/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var guestListLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var soldoutView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
