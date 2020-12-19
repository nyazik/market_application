//
//  Data.swift
//  HorizontalMenu
//
//  Created by Nazik on 17.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//

import Foundation
import  RealmSwift

class Product: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var descriptionName: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var image: String? = ""
    @objc dynamic var quantity: String? = ""
    
    @objc dynamic var isInCart : Bool = false
    @objc dynamic var lastView : Date? = nil

    
}
