//
//  Bar.swift
//  Chedli-Lakhdar-test-swift-Appartoo
//
//  Created by lakhdar chedli on 15/01/2019.
//  Copyright © 2019 appartoo. All rights reserved.
//

import UIKit
import ObjectMapper

class Bar: Mappable {
    
    var id: Int?
    var address: String?
    var name: String?
    var url: String?
    var image_url: String?
    var tags: String?
    var latitude: Double?
    var longitude: Double?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        address <- map["address"]
        name <- map["name"]
        url <- map["url"]
        image_url <- map["image_url"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
