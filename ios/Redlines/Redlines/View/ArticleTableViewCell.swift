//
//  ArticleTableViewCell.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    let fakeImageView = UIImageView(image: UIImage(named: "fake_stamp"))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    private func initialize() {
        accessoryType = .disclosureIndicator
        addSubview(fakeImageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        fakeImageView.frame = CGRect(x: self.frame.width * 0.9 - self.frame.height * 0.8, y: self.frame.height * 0.1, width: self.frame.height * 0.8, height: self.frame.height * 0.8)
    }
}
