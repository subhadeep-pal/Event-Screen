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
    
    private var isDescriptionExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func readMoreTapped(_ sender: UIButton) {
        if !isDescriptionExpanded {
            sender.setTitle("less", for: .normal)
            descriptionLabel.numberOfLines = 0
            isDescriptionExpanded = true
        } else {
            sender.setTitle("read more", for: .normal)
            descriptionLabel.numberOfLines = 3
            isDescriptionExpanded = false
        }
        
    }

}
