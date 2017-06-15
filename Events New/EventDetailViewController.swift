//
//  EventDetailViewController.swift
//  Events New
//
//  Created by Subhadeep Pal on 14/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var detailsViewController : UIViewController!
    var guestListViewController : GuestListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        setUpNavigationBar()
        setUpChildViewControllers()
        switchViews()
    }
    
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(EventDetailViewController.backTapped(sender:)))
        newBackButton.image = #imageLiteral(resourceName: "back")
        self.navigationItem.leftBarButtonItem = newBackButton
    }
    
    func setUpChildViewControllers() {
        
        
        detailsViewController = storyboard?.instantiateViewController(withIdentifier: "UnbookedEventDetails") as! UnbookedEventDetailViewController
        addChildViewController(detailsViewController)
        print(self.containerView.frame.height)
        
        guestListViewController = storyboard?.instantiateViewController(withIdentifier: "GuestListTableViewController") as! GuestListViewController
        addChildViewController(guestListViewController)
        
        print(self.containerView.frame.height)
    }
    
    func backTapped(sender: UIBarButtonItem) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViews(_ sender: UISegmentedControl) {
        switchViews()
    }
    
    func switchViews() {
        if segmentedControl.selectedSegmentIndex == 0 {
            guestListViewController.view.removeFromSuperview()
            guestListViewController.removeFromParentViewController()
            
            detailsViewController.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.width, height: self.containerView.frame.height)
            containerView.addSubview(detailsViewController.view)
            detailsViewController.didMove(toParentViewController: self)
        } else {
            detailsViewController.view.removeFromSuperview()
            detailsViewController.removeFromParentViewController()
            
            guestListViewController.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.width, height: self.containerView.frame.height)
            containerView.addSubview(guestListViewController.view)
            guestListViewController.didMove(toParentViewController: self)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
