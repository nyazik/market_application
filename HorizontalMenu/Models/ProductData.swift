//
//  ProductData.swift
//  HorizontalMenu
//
//  Created by Nazik on 13.12.2020.
//  Copyright © 2020 Ramprasad A. All rights reserved.
//

import Foundation

struct ProductData : Codable, Equatable {
    let id: Int?
    var title: String
    let price: Double
    let description: String
    let category: String
    let image: String?
}
