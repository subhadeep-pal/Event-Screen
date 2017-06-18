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
    @IBOutlet weak var eventDateLabel: UILabel!
    @IBOutlet weak var eventTimeLabel: UILabel!
    @IBOutlet weak var bookNowButton: UIButtonX!
    @IBOutlet weak var bookNowView: UIVisualEffectView!
    
    
    var eventViewModel: EventDetailViewModel!
    
    var detailsViewController : DetailViewController!
    var guestListViewController : GuestListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpNavigationBar()
        setUpChildViewControllers()
        setUpView()
        setUpBookNowView()
        switchViews()
    }
    
    
    func initializeViewModel(event: Event) {
        self.eventViewModel = EventDetailViewModel(event: event)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.isTranslucent = false
        navigationController?.popViewController(animated: true)
    }
    
    func setUpBookNowView() {
        if eventViewModel.isEventBooked() || eventViewModel.isSoldOut {
            bookNowButton.setTitle("Go to group chat", for: .normal)
        } else {
            bookNowButton.setTitle("Book Now", for: .normal)
        }
    }
    
    func setUpView() {
        title = eventViewModel.eventName()
        eventDateLabel.text = eventViewModel.eventDate()
        eventTimeLabel.text = eventViewModel.eventTime()
    }
    
    func setUpNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func setUpChildViewControllers() {
        if eventViewModel.isEventBooked() {
            detailsViewController = storyboard?.instantiateViewController(withIdentifier: "BookedEventDetails") as! BookedEventDetailViewController
        } else {
            detailsViewController = storyboard?.instantiateViewController(withIdentifier: "UnbookedEventDetails") as! UnbookedEventDetailViewController
        }
        detailsViewController.setUpViewModel(event: eventViewModel.getEvent())
        addChildViewController(detailsViewController)
        
        guestListViewController = storyboard?.instantiateViewController(withIdentifier: "GuestListTableViewController") as! GuestListViewController
        guestListViewController.setUpViewModel(event: eventViewModel.getEvent())
        addChildViewController(guestListViewController)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func shareTapped(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: [eventViewModel.textForSharing()], applicationActivities: nil)
        if let popoverPresentationController = activityViewController.popoverPresentationController {
            popoverPresentationController.barButtonItem = (sender as! UIBarButtonItem)
        }
        present(activityViewController, animated: true, completion: nil)
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
            
            if eventViewModel.isEventBooked() || eventViewModel.isSoldOut {
                bookNowView.isHidden = true
            } else {
                bookNowView.isHidden = false
            }
        } else {
            detailsViewController.view.removeFromSuperview()
            detailsViewController.removeFromParentViewController()
            
            guestListViewController.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.width, height: self.containerView.frame.height)
            containerView.addSubview(guestListViewController.view)
            guestListViewController.didMove(toParentViewController: self)
            
            bookNowView.isHidden = false
        }
    }
}
