//
//  ProductDetailViewController.swift
//  HorizontalMenu
//
//  Created by Nazik on 13.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//
protocol ProductDetailViewControllerDelegate {
    func addItemToCart()
}

import UIKit

class ProductDetailViewController: UIViewController {

    var delegate : ProductDetailViewControllerDelegate?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    var product: ProductData?
    var cartTableViewController : CartTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = sender.value
        productQuantity.text = "\(value)"
        productPrice.text = "\(value * (product?.price ?? 0))"
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        cartTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "CartTableViewController") as? CartTableViewController
//        cartTableViewController!.modalPresentationStyle = .popover
//        let popover = self.cartTableViewController!.popoverPresentationController
        
//        let cell = self.collectionView.cellForItem(at: indexPath) as! Cell
        let _ = cartTableViewController?.view
//        cartTableViewController?.image.image = product?.image
        
        if let data = self.product {
            cartTableViewController?.populate1(with: data)
            
        }
        
        dismiss(animated: true, completion: nil)

//        popover!.sourceView = self.view
//        present(self.cartTableViewController!, animated: true, completion: nil)
    }
    
    func populate(with product: ProductData){
        
        self.product = product
        
        stepper.value = 1
        stepper.minimumValue = 1.0
        stepper.stepValue = 1
        
        productPrice.text = "\(product.price)"
        productTitle.text = product.title
        
    }
    
    
    
}
