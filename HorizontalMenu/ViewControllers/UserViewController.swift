//
//  UserViewController.swift
//  HorizontalMenu
//
//  Created by Nazik on 17.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//

import UIKit
//import Firebase
import GoogleSignIn


class UserViewController: UIViewController {

    //@IBOutlet weak var signInButton: GIDSignInButton!
    
  
    @IBAction func sign(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.signIn()
//        GIDSignIn.sharedInstance().restorePreviousSignIn()

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance()?.signIn()
//        GIDSignIn.sharedInstance().restorePreviousSignIn()

    }
    
    
  

}
