//
//  PopularViewController.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var popularView: PopularView {
        return self.view as! PopularView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Popular"
        popularView.delegate = self
        popularView.dataSource = self
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.row != 0) {
            // Not the segmented control
        }
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = UITableViewCell()
        if (indexPath.row == 0) {
            let sc = UISegmentedControl(items: ["Most Views", "Most Votes"])
            sc.center = CGPoint(x: self.view.center.x, y: result.center.y)
            sc.addTarget(self, action: #selector(PopularViewController.segmentedControlDidChangeValue), for: .valueChanged)
            sc.selectedSegmentIndex = 0
            result.addSubview(sc)
            result.selectionStyle = .none
        }
        return result
    }
    
    // MARK: private
    
    @objc func segmentedControlDidChangeValue() {
        
    }

    func getMostViewedArticles() {
        
    }
}
