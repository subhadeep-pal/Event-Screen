//
//  GuestListTableViewCell.swift
//  Events New
//
//  Created by Subhadeep Pal on 18/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class GuestListTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var shadowView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func draw(_ rect: CGRect) {
        let brezierPath = UIBezierPath(roundedRect: self.profileImageView.bounds, byRoundingCorners: [.topLeft , .topRight, .bottomRight], cornerRadii: CGSize(width: 21, height: 21))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.contentView.bounds
        maskLayer.path = brezierPath.cgPath
        self.profileImageView.layer.mask = maskLayer
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 1, height: 2)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 2.0
        shadowView.layer.shadowPath = brezierPath.cgPath
        
    }

}
