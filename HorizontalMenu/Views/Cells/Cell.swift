//
//  Cell.swift
//  HorizontalMenu
//
//  Created by Nazik on 12.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var thirdViewController = ThirdViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    
    
    @IBAction func addtToChart(_ sender: UIButton) {
        
        
    
        

        let alert = UIAlertController(title: "Sepete Ekle", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "SEPETE EKLE", style: .default) { (alert) in
            print("success")
        }
        alert.addAction(action)

 
        if let vc = self.next(ofType: UIViewController.self) {
            vc.present(alert, animated: true, completion: nil)
        }
    
    }
    


}
extension UIResponder {
    func next<T:UIResponder>(ofType: T.Type) -> T? {
        let r = self.next
        if let r = r as? T ?? r?.next(ofType: T.self) {
            return r
        } else {
            return nil
        }
    }
}
