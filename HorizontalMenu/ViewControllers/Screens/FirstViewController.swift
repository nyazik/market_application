//
//  FirstViewController.swift
//  HorizontalMenu
//
//  Created by Ramprasad A on 13/01/18.
//  Copyright © 2018 Ramprasad A. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class FirstViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var product: [ProductData] = []
    var productProvider = ProductProvider()
    var productDetailViewController : ProductDetailViewController?
    var productDetailStoryboardID = "productDetailStoryboardID"
    let cellIdentifier = "Cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupCollectionView()
        fetchPhotos()
        
        
    }
    
    func fetchPhotos() {
        print("Fetching...")
        productProvider.fetch() {product in
            self.updatePhotosAfterFetching(product)
        }
    }
    
    func updatePhotosAfterFetching(_ product: [ProductData]){
        self.product = product
        collectionView.reloadData()

    }
    
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib.init(nibName: cellIdentifier, bundle: nil ), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.alwaysBounceVertical = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

//MARK:- UICollectionViewDataSource
extension FirstViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? Cell else {return UICollectionViewCell()}
        
        if let imageUrl = product[indexPath.item].image{
            let url = URL(string: imageUrl)
            cell.productImage.kf.setImage(with: url)
            cell.productTitle.text = String(product[indexPath.item].title)
            cell.productPrice.text = String(product[indexPath.item].price)
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        productDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: productDetailStoryboardID) as? ProductDetailViewController
        productDetailViewController!.modalPresentationStyle = .popover
        let popover = self.productDetailViewController!.popoverPresentationController
        let cell = self.collectionView.cellForItem(at: indexPath) as! Cell
        let _ = productDetailViewController?.view
        productDetailViewController?.productImage.image = cell.productImage.image
        let data = self.product[indexPath.item]
        productDetailViewController?.populate(with: data)
        popover!.sourceView = self.view
        present(self.productDetailViewController!, animated: true, completion: nil)
        
    }
    
    
}

//MARK:- UICollectionViewDelegateFlowLayout
extension FirstViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let screenWidth = UIScreen.main.bounds.width
        //print(screenWidth)
        var width = (screenWidth-30)/2
        
        width = width > 200 ? 200 : width
        return CGSize.init(width: width, height: width)
    }
    
    
    
}
