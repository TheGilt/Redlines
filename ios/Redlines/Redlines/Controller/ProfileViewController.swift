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
        let loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
    }
}
