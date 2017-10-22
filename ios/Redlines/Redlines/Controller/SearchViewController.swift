//
//  SearchViewController.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    var searchView: SearchView {
        return self.view as! SearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.searchBar.delegate = self
    }

    // MARK: UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

