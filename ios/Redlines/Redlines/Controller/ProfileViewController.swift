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

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FBSDKLoginButtonDelegate {
    
    var profileView: ProfileView {
        return self.view as! ProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileView.loginButton.delegate = self
        profileView.tableView.dataSource = self
        profileView.tableView.delegate = self
        profileView.tableView.tableFooterView = UIView()
        if (FBSDKAccessToken.current() != nil) {
            // User logged in
            
            // TODO: use FBSDKLoginManager.userID to identify user on server
        } else {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Profile"
        if (FBSDKAccessToken.current() != nil) {
            // User logged in
            profileView.tableView.isHidden = false
            profileView.loginButton.removeFromSuperview()
            profileView.loginLabel.isHidden = true
        } else {
            profileView.tableView.isHidden = true
            self.view.addSubview(profileView.loginButton)
            profileView.loginLabel.isHidden = false
        }
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.section == 0) {
            
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                // Log out
                FBSDKLoginManager().logOut()
                profileView.tableView.isHidden = true
                self.view.addSubview(profileView.loginButton)
                profileView.loginLabel.isHidden = false
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 3
        } else if (section == 1) {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let result = UITableViewCell()
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                result.textLabel?.text = "Pages Visited"
                result.accessoryType = .disclosureIndicator
            } else if (indexPath.row == 1) {
                result.textLabel?.text = "Votes"
                result.accessoryType = .disclosureIndicator
            } else if (indexPath.row == 2) {
                result.textLabel?.text = "Comments"
                result.accessoryType = .disclosureIndicator
            }
        } else if (indexPath.section == 1) {
            if (indexPath.row == 0) {
                result.textLabel?.text = "Log Out"
            }
        }
        return result
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "History"
        case 1: return "Settings"
        default: return nil
        }
    }

    // MARK: FBSDKLoginButtonDelegate
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if (FBSDKAccessToken.current() != nil) {
            // User logged in
            profileView.tableView.isHidden = false
            profileView.loginButton.removeFromSuperview()
            profileView.loginLabel.isHidden = true
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        profileView.tableView.isHidden = true
        self.view.addSubview(profileView.loginButton)
        profileView.loginLabel.isHidden = false
    }
}
