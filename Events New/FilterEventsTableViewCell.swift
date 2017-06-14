//
//  FilterEventsTableViewCell.swift
//  Events New
//
//  Created by 01HW934413 on 14/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class FilterEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var filterTextLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
