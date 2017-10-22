//
//  PopularViewController.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit

class PopularViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var mostViewedArticles: Array<Article>!
    var mostVotedArticles: Array<Article>!
    var sc = UISegmentedControl(items: ["Most Views", "Most Votes"])
    
    var popularView: PopularView {
        return self.view as! PopularView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostVotedArticles = getMostVotedArticles()
        mostViewedArticles = getMostViewedArticles()
        sc.selectedSegmentIndex = 0
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
            navigationController?.pushViewController(ArticleOneUpViewController(), animated: true)
        }
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (sc.selectedSegmentIndex == 0) {
            return mostViewedArticles.count + 1
        } else {
            // sc.selectedSegmentIndex == 1
            return mostVotedArticles.count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result: UITableViewCell
        if (indexPath.row == 0) {
            result = UITableViewCell()
            sc.center = CGPoint(x: self.view.center.x, y: result.center.y)
            sc.addTarget(self, action: #selector(PopularViewController.segmentedControlDidChangeValue), for: .valueChanged)
            sc.selectedSegmentIndex = 0
            result.addSubview(sc)
            result.selectionStyle = .none
        } else {
            result = ArticleTableViewCell()
            if (sc.selectedSegmentIndex == 0) {
                result.textLabel?.text = mostViewedArticles![indexPath.row - 1].title
            } else {
                result.textLabel?.text = mostVotedArticles![indexPath.row - 1].title
            }
        }
        return result
    }
    
    // MARK: private
    
    @objc func segmentedControlDidChangeValue() {
        
    }

    func getMostViewedArticles() -> Array<Article> {
        var result = Array<Article>()
        result.append(Article(title: "art1", url: "cnn.com/myarticle", source: "cnn", fakeVotes: 3, realVotes: 50, wiki: "I think this article is real cos it comes from CNN.", comments: Array<Comment>()))
        result.append(Article(title: "art2", url: "nytimes.com/myarticle", source: "nytimes", fakeVotes: 0, realVotes: 5, wiki: "I think this article is real cos it comes from nyt.", comments: Array<Comment>()))
        return result
    }
    
    func getMostVotedArticles() -> Array<Article> {
        var result = Array<Article>()
        result.append(Article(title: "art3", url: "cnn.com/myarticle", source: "cnn", fakeVotes: 3, realVotes: 50, wiki: "I don't care about this article.", comments: Array<Comment>()))
        result.append(Article(title: "art4", url: "nytimes.com/myarticle", source: "nytimes", fakeVotes: 0, realVotes: 5, wiki: "I think this article is fake yo.", comments: Array<Comment>()))
        return result
    }
}
