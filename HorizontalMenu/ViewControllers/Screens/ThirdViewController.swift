//
//  ThirdViewController.swift
//  HorizontalMenu
//
//  Created by Ramprasad A on 13/01/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func qqq(_ sender: Any) {
        
        let logoutAlert = UIAlertController(title: "Alert", message: "DemoAlert", preferredStyle: UIAlertControllerStyle.alert)

        logoutAlert.addAction(UIAlertAction(title: "cancel", style: .default, handler: nil))

        logoutAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in

            // Write your code here

        }))

        var stepper = UIStepper()
        stepper.frame = CGRect(x: CGFloat(12.0), y: CGFloat(5.0), width: CGFloat(100), height: CGFloat(10))

        // You can add any view on UIAlert controller using below code:

        logoutAlert.popoverPresentationController?.sourceRect = stepper.frame
//
        logoutAlert.popoverPresentationController?.sourceView = stepper


        self.present(logoutAlert, animated: true, completion: nil)
        
        
//
        
        
//        let alert = UIAlertController(title: "Add new todoItem", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "add item", style: .default) { (alert) in
//            print("success")
//        }
//        alert.addAction(action)
//        present(alert, animated: true, completion : nil)
    }
    
}
