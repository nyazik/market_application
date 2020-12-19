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
import RealmSwift


class ProductDetailViewController: UIViewController {
    
    let realm = try! Realm()
    
    var delegate : ProductDetailViewControllerDelegate?
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    var product: ProductData?
    var cartTableViewController : CartTableViewController?
    var productArray = [Product]()
    
    
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
        
        if let data = self.product, let quantity = productQuantity.text, let price =  productPrice.text{
            //cartTableViewController?.populate1(with: data)
            let newCategory = Product()
            newCategory.title = String(data.title)
            newCategory.category = data.category
            newCategory.price = Double(price)!
            newCategory.image = data.image!
            newCategory.quantity = quantity
            newCategory.isInCart = true
            print("quantity \(productQuantity.text)")
            self.productArray.append(newCategory)
            
            self.save(product: newCategory)
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


extension ProductDetailViewController {
    
    func save(product: Product){
        do{
            try realm.write(){
                realm.add(product)
            }
        }catch{
            print("error saving categories\(error)")
        }
//        tableView.reloadData()
    }
    
}

