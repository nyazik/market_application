//
//  CartTableViewController.swift
//  HorizontalMenu
//
//  Created by Nazik on 15.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//

import UIKit

class YourCell : UITableViewCell{
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productTitle: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productQuantity: UILabel!
    
}

class CartTableViewController: UITableViewController {
    
    var cell: YourCell?
    
    var product: [ProductData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(product)
        return product.count //product.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell", for: indexPath) as! YourCell
        
        if let imageUrl = product[indexPath.row].image{
            let url = URL(string: imageUrl)
            cell.productImage.kf.setImage(with: url)
            cell.productTitle.text = String(product[indexPath.row].title)
            cell.productPrice.text = String(product[indexPath.row].price)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")

            self.tableView.deleteRows(at: [indexPath], with: .automatic)
//            tableView.reloadData()
          }
    }
    
    
    
    func populate1(with product: ProductData){
        self.product = [product]
        print(self.product)
        tableView.reloadData()
    }
    
    
    
}

    
    

