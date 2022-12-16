//
//  ViewController.swift
//  iOSFinal
//
//  Created by Ankit Gusai on 15/12/22.
//

import UIKit
import FacebookLogin


class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var forgotPassword: UIButton!
    
    @IBOutlet weak var fbLLoginBtn: FBLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Extend the code sample from 6a. Add Facebook Login to Your Code
        // Add to your viewDidLoad method:
    
        
        if let token = AccessToken.current,
           !token.isExpired {
            // User is logged in, do work such as go to next view controller.
            print("user already logged in ")
            //seque to different page
            let SettingsTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingsTableViewController") as! SettingsTableViewController
            SettingsTableViewController.modalPresentationStyle = .fullScreen
            SettingsTableViewController.modalTransitionStyle = .coverVertical
            self.present(SettingsTableViewController, animated: true, completion: nil)
            
        }
        else{
            fbLLoginBtn.permissions = ["public_profile", "email"]
            fbLLoginBtn.backgroundColor = UIColor(red: (59/255.0), green: (89/255.0), blue: (152/255.0), alpha: 1)
            fbLLoginBtn.frame = CGRectMake(210, 626.67,158,34.33)
            fbLLoginBtn.layer.cornerRadius = 8
            view.addSubview(fbLLoginBtn)
        }
        
    }
    
}
