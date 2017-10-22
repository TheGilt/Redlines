//
//  ProfileView.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ProfileView: UIView {
    let tableView = UITableView()
    let loginLabel = UILabel()
    let loginButton = FBSDKLoginButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(tableView)
        
        self.addSubview(loginButton)
        
        loginLabel.text = "Log in with Facebook to\nvote and comment."
        loginLabel.numberOfLines = 2
        loginLabel.textColor = UIColor.darkText
        loginLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        loginLabel.textAlignment = .center
        self.addSubview(loginLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addSubview(tableView)
        
        self.addSubview(loginButton)
        
        loginLabel.text = "Log in with Facebook to\nvote and comment."
        loginLabel.numberOfLines = 2
        loginLabel.textColor = UIColor.darkText
        loginLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        loginLabel.textAlignment = .center
        self.addSubview(loginLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = self.frame
        
        loginLabel.frame = CGRect(x: 0, y: self.frame.height / 2 - self.frame.height * 0.2, width: self.frame.width, height: self.frame.height * 0.3)
        
        loginButton.center = CGPoint(x: self.center.x, y: loginLabel.frame.origin.y + loginLabel.frame.height + self.frame.height * 0.025)
    }
}
