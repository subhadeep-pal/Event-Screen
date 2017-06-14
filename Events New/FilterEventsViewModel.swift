//
//  FilterEventsViewModel.swift
//  Events New
//
//  Created by 01HW934413 on 14/06/17.
//  Copyright © 2017 Subhadeep Pal. All rights reserved.
//

import UIKit

class FilterEventsViewModel: NSObject {
    
    
    private let CITY_FILTERS = ["Bengaluru", "Mumbai", "Delhi", "Pune"]
    private let TYPE_FILTERS = ["Upcoming", "Past", "All"]
    private let SORT_BY = ["Event Date", "Number of Guests", "Closest to me"]
    
    private var filteredCities : [String] = []
    private var filteredType : [String] = []
    private var sortBy : String?
    
    func reset() {
        filteredType = []
        filteredCities = []
        sortBy = nil
    }
    
    func numberOfFiltersForSection(section: Int) -> Int {
        switch section {
        case 0:
            return CITY_FILTERS.count
        case 1:
            return TYPE_FILTERS.count
        case 2:
            return SORT_BY.count
        default:
            return 0
        }
    }
    
    func filterText(index: IndexPath) -> String {
        switch index.section {
        case 0:
            return CITY_FILTERS[index.row]
        case 1:
            return TYPE_FILTERS[index.row]
        case 2:
            return SORT_BY[index.row]
        default:
            return ""
        }
    }
    
    func isFilterApplied(index: IndexPath) -> Bool {
        switch index.section {
        case 0:
            if filteredCities.contains(CITY_FILTERS[index.row]) {
                return true
            }
        case 1:
            if filteredType.contains(TYPE_FILTERS[index.row]) {
                return true
            }
        case 2:
            if sortBy == SORT_BY[index.row]{
                return true
            }
        default:
            return false
        }
        return false
    }
    
    func filterHeadingForSection(section: Int) -> String {
        switch section {
        case 0:
            return "FILTER CITY"
        case 1:
            return "FILTER BY TYPE"
        case 2:
            return "SORT BY"
        default:
            return ""
        }
    }
    
    func filterAppliedAtIndex(index: IndexPath) {
        switch index.section {
        case 0:
            filteredCities.append(CITY_FILTERS[index.row])
        case 1:
            filteredType.append(TYPE_FILTERS[index.row])
        case 2:
            sortBy = SORT_BY[index.row]
        default:
            break
        }
    }
    func removeFilterAtIndex(indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let index = filteredCities.index(of: CITY_FILTERS[indexPath.row])!
            filteredCities.remove(at: index)
        case 1:
            let index = filteredType.index(of: TYPE_FILTERS[indexPath.row])!
            filteredType.remove(at: index)
        case 0:
            sortBy = nil
        default:
            break
        }
    }
}
