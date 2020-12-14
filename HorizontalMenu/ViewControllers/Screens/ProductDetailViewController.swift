//
//  ProductDetailViewController.swift
//  HorizontalMenu
//
//  Created by Nazik on 13.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    var quantityF : String = ""
    var priceF : String = ""
    var finalPrice : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.value = 1
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        productQuantity.text = Int(sender.value).description
        
        if let quantity = productQuantity.text{
            quantityF = quantity
            print(quantityF)
        }
        if let price = productPrice.text{
            priceF = price
            print(priceF)
        finalPrice = (Double(quantityF)! * Double(priceF)!)
        print(finalPrice)
        }
        
        productPrice.text = String(finalPrice)
        
//            if var quantity = productQuantity.text, var price = productPrice.text{
//                finalPrice = Double(quantity)! * Double(price)!
//            }
            
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
    }
    
    func populate(with product: ProductData){
        
        productPrice.text = String(product.price)
        productTitle.text = product.title
        
    }

    
    
    
    
}
