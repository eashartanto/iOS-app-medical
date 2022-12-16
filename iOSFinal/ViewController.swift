//
//  ViewController.swift
//  iOSFinal
//
//  Created by Ankit Gusai on 15/12/22.
//

import UIKit
import FacebookLogin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        
        // Extend the code sample from 6a. Add Facebook Login to Your Code
        // Add to your viewDidLoad method:
        loginButton.permissions = ["public_profile", "email"]
          
        view.addSubview(loginButton)
        
        if let token = AccessToken.current,
                !token.isExpired {
                // User is logged in, do work such as go to next view controller.
                print("user already logged in ")
            }
    }

}


