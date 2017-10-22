//
//  SearchViewController.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit

var topBarHeight: CGFloat = 0;

class SearchViewController: UIViewController, UISearchBarDelegate {

    var searchView: SearchView {
        return self.view as! SearchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.searchBar.delegate = self
        topBarHeight = 20 + (self.navigationController?.navigationBar.frame.size.height)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Search"
    }

    // MARK: UISearchBarDelegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

