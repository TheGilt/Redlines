//
//  ProfileViewController.swift
//  Redlines
//
//  Created by Kennan Mell on 10/21/17.
//  Copyright © 2017 Kennan Mell. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if (FBSDKAccessToken.current() != nil) {
            // User logged in
            
            // TODO: use FBSDKLoginManager.userID to identify user on server
        } else {
            let loginButton = FBSDKLoginButton()
            loginButton.center = self.view.center
            self.view.addSubview(loginButton)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Profile"
    }
}
