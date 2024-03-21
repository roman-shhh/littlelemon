//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Roman on 17.03.2024.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    var id = UUID()
    let title : String
    let image: String
    let price: String
    let descriptionDish: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case descriptionDish = "description"
        case price = "price"
        case image = "image"
        case category = "category"
    }
}
