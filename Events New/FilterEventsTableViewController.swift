//
//  FilterEventsTableViewController.swift
//  Events New
//
//  Created by 01HW934413 on 14/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

protocol FilterDelegate {
    func filterApplied(cityFilter: [String]?, typeFilter: [String]?, sortBy: String?)
}

class FilterEventsTableViewController: UITableViewController {
    
    @IBOutlet weak var filterViewModel: FilterEventsViewModel!

    var delegate : FilterDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 42
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterViewModel.numberOfFiltersForSection(section: section)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! FilterEventsTableViewCell
        
        cell.filterTextLabel.text = filterViewModel.filterText(index: indexPath)
        
        if filterViewModel.isFilterApplied(index: indexPath) {
            cell.checkBoxButton.image = #imageLiteral(resourceName: "checkbox_checked")
        } else {
            cell.checkBoxButton.image = #imageLiteral(resourceName: "checkbox_unchecked")
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("FilterEventsSectionHeader", owner: self, options: nil)?.first as! FilterEventsSectionHeader
        headerView.headerTextLabel.text = filterViewModel.filterHeadingForSection(section: section)
        return headerView
    }
 
    @IBAction func resetTapped(_ sender: UIBarButtonItem) {
        filterViewModel.reset()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if filterViewModel.isFilterApplied(index: indexPath) {
            filterViewModel.removeFilterAtIndex(indexPath: indexPath)
        } else {
            filterViewModel.filterAppliedAtIndex(index: indexPath)
        }
        
        tableView.reloadSections(IndexSet(integer: indexPath.section) , with: .none)
        delegate.filterApplied(cityFilter: filterViewModel.getCityFilters(), typeFilter: filterViewModel.getTypeFilters(), sortBy: filterViewModel.getSortBy())
    }
}
