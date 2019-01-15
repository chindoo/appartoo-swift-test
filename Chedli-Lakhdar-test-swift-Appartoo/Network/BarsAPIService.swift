//
//  BarsAPIService.swift
//  Chedli-Lakhdar-test-swift-Appartoo
//
//  Created by lakhdar chedli on 15/01/2019.
//  Copyright © 2019 appartoo. All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

class BarsAPIService {
    
    
    
    static func fetchBars() -> [Bar] {
        
        let urlPath = Bundle.main.path(forResource: "Pense bete", ofType: "json")
        var bars = [Bar]()
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: urlPath!), options: .alwaysMapped)
            let json = try JSON(data: data)
            
            for bar in json["bars"] {
                
                if let bar = Bar(JSONString: bar.1.rawString()!) {
                    bars.append(bar)
                }
            }
            
            return bars
        } catch let error {
            print("parse error: \(error.localizedDescription)")
        }
        
       return [Bar]()
    }
}
