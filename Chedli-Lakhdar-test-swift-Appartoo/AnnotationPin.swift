//
//  AnnotationPin.swift
//  Chedli-Lakhdar-test-swift-Appartoo
//
//  Created by lakhdar chedli on 15/01/2019.
//  Copyright © 2019 appartoo. All rights reserved.
//

import UIKit
import MapKit

class AnnotationPin: NSObject, MKAnnotation {
    public var title: String?
    public var subtitle: String?
    public var coordinate: CLLocationCoordinate2D
    
    
    
    init(title: String, Subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = Subtitle
        self.coordinate = coordinate
    }
}
