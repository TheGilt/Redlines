//
//  SearchView.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit

class SearchView: UIView {
    var searchBar = UISearchBar()
    var placeholderLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchBar.placeholder = "Search"
        self.addSubview(searchBar)
        
        placeholderLabel.text = "Search for articles or sources\nby title or url."
        placeholderLabel.numberOfLines = 2
        placeholderLabel.textColor = UIColor.darkText
        placeholderLabel.font = UIFont.systemFont(ofSize: 20)
        placeholderLabel.textAlignment = .center
        self.addSubview(placeholderLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        searchBar.placeholder = "Search"
        self.addSubview(searchBar)
        
        placeholderLabel.text = "Search for articles or sources\nby title or url."
        placeholderLabel.numberOfLines = 2
        placeholderLabel.textColor = UIColor.darkText
        placeholderLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        placeholderLabel.textAlignment = .center
        self.addSubview(placeholderLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        searchBar.frame = CGRect(x: 0, y: 20, width: self.frame.width, height: self.frame.height * 0.08)
        placeholderLabel.frame = CGRect(x: 0, y: self.frame.height / 2 - self.frame.height * 0.15, width: self.frame.width, height: self.frame.height * 0.3)
    }
}
