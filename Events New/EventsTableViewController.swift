//
//  EventsTableViewController.swift
//  Events New
//
//  Created by 01HW934413 on 13/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class EventsTableViewController: UITableViewController {

    @IBOutlet weak var eventsViewModel : EventsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventsViewModel.numberOfEvents()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell

        // Configure the cell...
        cell.eventNameLabel.text = eventsViewModel.nameForEvent(index: indexPath.row)
        cell.timeLabel.text = eventsViewModel.timeForEvent(index: indexPath.row)
        cell.locationLabel.text = eventsViewModel.locationForEvent(index: indexPath.row)
        cell.dateLabel.text = eventsViewModel.dateForEvent(index: indexPath.row)
        cell.guestListLabel.text = eventsViewModel.guestAttentingDescriptionForEvent(index: indexPath.row)
        
        if eventsViewModel.isEventSoldOut(index: indexPath.row) {
            cell.soldoutView.isHidden = false
        } else {
            cell.soldoutView.isHidden = true
        }
        
        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSegue" {
            let navVC = segue.destination as! UINavigationController
            navVC.transitioningDelegate = self
            navVC.modalPresentationStyle = .custom
            let filterVC = navVC.viewControllers.first as! FilterEventsTableViewController
            filterVC.delegate = self
        } else if segue.identifier == "eventDetailSegue" {
            let eventDetailVC = segue.destination as! EventDetailViewController
            eventDetailVC.initializeViewModel(event: sender as! Event)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "eventDetailSegue", sender: eventsViewModel.eventForIndex(index: indexPath.row))
    }
    

}

extension EventsTableViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = SlideInPresentationController(presentedViewController: presented,
                                                                   presenting: presenting,
                                                                   direction: .right)
        return presentationController
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: .right, isPresentation: true)
        
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideInPresentationAnimator(direction: .right, isPresentation: false)
    }
}

extension EventsTableViewController : FilterDelegate {
    func filterApplied(cityFilter: [String]?, typeFilter: [String]?, sortBy: String?) {
        
    }
}
