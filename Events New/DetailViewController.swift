//
//  DetailViewController.swift
//  Events New
//
//  Created by 01HW934413 on 16/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailViewModel: DetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setUpViewModel(event: Event) {
        detailViewModel = DetailsViewModel(event: event)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
