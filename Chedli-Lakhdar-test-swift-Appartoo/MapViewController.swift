//
//  MapViewController.swift
//  Chedli-Lakhdar-test-swift-Appartoo
//
//  Created by lakhdar chedli on 15/01/2019.
//  Copyright © 2019 appartoo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var pin:AnnotationPin!
    var bars = [Bar]()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpMapView()
        addAnnotations()
    }
    
    func setUpMapView(){
        
        mapView.delegate = self
        
        if bars.count == 0 {
            
            bars = BarsAPIService.fetchBars()
        }
        
        let center = CLLocationCoordinate2DMake(bars[0].latitude!,bars[0].longitude!)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
    }
    
    func addAnnotations() {

        for bar in bars {
            
            mapView.addAnnotation(AnnotationPin(title: bar.name!, Subtitle: bar.address!, coordinate: CLLocationCoordinate2DMake(bar.latitude!,bar.longitude!)))
            
        }
    }

}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        annotationView.canShowCallout = true
        let pinImage = UIImage(named: "appartoo-pin")!
        annotationView.image = pinImage

        return annotationView
    }

}
