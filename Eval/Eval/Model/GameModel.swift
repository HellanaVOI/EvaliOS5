//
//  GameModel.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import Foundation

struct listGame: Codable {
    let featured_win: [GameModel]
    let featured_mac: [GameModel]
    let featured_linux: [GameModel]
}

struct GameModel: Codable, Identifiable, Hashable{
    
    let id: Int?
    let name: String?
    let discounted: Bool?
    let discountPercent: Int?
    let originalPrice: Int?
    let finalPrice: Int?
    let currency: String?
    let largeImage: String?
    let smallImage: String?
    let windowsAvailable: Bool?
    let macAvailable: Bool?
    let linuxAvailable: Bool?
    let controllerSupport: String?
    
    enum CodingKeys: String, CodingKey{
       case id = "id"
       case name = "name"
       case discounted = "discounted"
       case discountPercent = "discount_percent"
       case originalPrice = "original_price"
       case finalPrice = "final_price"
       case currency = "currency"
       case largeImage = "large_capsule_image"
       case smallImage = "small_capsule_image"
       case windowsAvailable = "windows_available"
       case macAvailable = "mac_available"
       case linuxAvailable = "linux_available"
       case controllerSupport = "controller_support"
    }
    
}
