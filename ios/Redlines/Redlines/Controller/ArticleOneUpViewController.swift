//
//  ArticleOneUpViewController.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit

class ArticleOneUpViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    var article: Article!
    let textView = UITextView()
    let voteFakeButton = UIButton()
    let voteRealButton = UIButton()
    
    convenience init(article: Article) {
        self.init(nibName:nil, bundle:nil)
        let myView = UITableView()
        self.view = myView
        myView.delegate = self
        myView.dataSource = self
        myView.tableFooterView = UIView()
        self.article = article
        voteFakeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ArticleOneUpViewController.didTapVoteFakeButton)))
        voteRealButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ArticleOneUpViewController.didTapVoteRealButton)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section != 2 || indexPath.row != 0) {
            textView.resignFirstResponder()
        }
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 3
        } else if (section == 1) {
            return 2
        } else if (section == 2) {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = UITableViewCell()
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                result.textLabel?.text = article.title
            } else if (indexPath.row == 1) {
                result.textLabel?.text = article.url
            } else if (indexPath.row == 2) {
                result.textLabel?.text = article.source
            }
        } else if (indexPath.section == 1) {
            if (article.userVotedFake) {
                voteFakeButton.setImage(UIImage(named: "vote_selected"), for: .normal)
            } else {
                voteFakeButton.setImage(UIImage(named: "vote_unselected"), for: .normal)
            }
            
            if (article.userVotedReal) {
                voteRealButton.setImage(UIImage(named: "vote_selected"), for: .normal)
            } else {
                voteRealButton.setImage(UIImage(named: "vote_unselected"), for: .normal)
            }
            if (indexPath.row == 0) {
                result.textLabel?.text = String(format: "Real: %d", article.realVotes)
                result.addSubview(voteRealButton)
                voteRealButton.frame = CGRect(x: self.view.frame.width * 0.97 - result.frame.height * 0.8, y: result.frame.height * 0.1, width: result.frame.height * 0.8, height: result.frame.height * 0.8)
            } else if (indexPath.row == 1) {
                result.textLabel?.text = String(format: "Fake: %d", article.fakeVotes)
                result.addSubview(voteFakeButton)
                voteFakeButton.frame = CGRect(x: self.view.frame.width * 0.97 - result.frame.height * 0.8, y: result.frame.height * 0.1, width: result.frame.height * 0.8, height: result.frame.height * 0.8)
            }
        } else if (indexPath.section == 2) {
            textView.text = article.wiki
            result.addSubview(textView)
            textView.frame = CGRect(x: self.view.frame.width * 0.05, y: 0, width: self.view.frame.width * 0.9, height: 200)
            textView.font = UILabel().font
            textView.delegate = self
        }
        result.selectionStyle = .none
        return result
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 2) {
            return textView.frame.height
        }
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "Article"
        } else if (section == 1) {
            return "Votes"
        } else if (section == 2) {
            return "Wiki"
        }
        return nil
    }
    
    // MARK: UITextViewDelegate
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
    
    // MARK: Private
    
    @objc func didTapVoteRealButton() {
        if (article.userVotedReal) {
            article.userVotedReal = false
            article.realVotes -= 1
        } else if (article.userVotedFake) {
            article.userVotedFake = false
            article.fakeVotes -= 1
            article.userVotedReal = true
            article.realVotes += 1
        } else {
            article.userVotedReal = true
            article.realVotes += 1
        }
        (self.view as! UITableView).reloadData()
    }
    
    @objc func didTapVoteFakeButton() {
        if (article.userVotedFake) {
            article.userVotedFake = false
            article.fakeVotes -= 1
        } else if (article.userVotedReal) {
            article.userVotedReal = false
            article.realVotes -= 1
            article.userVotedFake = true
            article.fakeVotes += 1
        } else {
            article.userVotedFake = true
            article.fakeVotes += 1
        }
        (self.view as! UITableView).reloadData()
    }

}
