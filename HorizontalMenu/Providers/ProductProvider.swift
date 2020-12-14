//
//  ProductProvider.swift
//  HorizontalMenu
//
//  Created by Nazik on 13.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//

import Foundation
import  Alamofire
struct ProductProvider  {
    var productURL = "https://fakestoreapi.com/products"
    
    func fetch (completion: @escaping ([ProductData]) -> Void){
        
        var url = "https://fakestoreapi.com/products"
        
        AF.request(url).responseString{responce in
            debugPrint(responce.data as? Any)
            print(responce.data)
            
            guard let data = responce.data else {
                print("unable to to fetch data from URL:\(url)")
                return
            }
            
            print(url)
            
            guard let decodedData = try? JSONDecoder().decode([ProductData].self, from: data) else {
                print("sorry, unable to decode json data")
                return
            }
            DispatchQueue.main.async {
                completion(decodedData)
            }
            print(decodedData)
        }
    }
    
}
