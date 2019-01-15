//
//  BarsTableViewController.swift
//  Chedli-Lakhdar-test-swift-Appartoo
//
//  Created by lakhdar chedli on 15/01/2019.
//  Copyright © 2019 appartoo. All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation

class BarsTableViewController: UITableViewController {

  
    let locationManager: CLLocationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var bars = [Bar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        fetchBars()
    }
    
    func fetchBars() {
        
        bars = BarsAPIService.fetchBars()
    }

    func checkCurrentLocation() {
    
        if (CLLocationManager.locationServicesEnabled())
        {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        }
        else
        {
        let alert = UIAlertController(title: "Error", message: "Enabling location services is requeried", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            }))
        self.present(alert, animated: true, completion: nil)
        
        }
    
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BarsTableViewCell

        
        cell.barImageView.sd_setImage(with: URL(string: "http://www.cartetamtam.fr/wp-content/uploads/2017/02/5-1.jpg"), completed: nil)
        cell.barNameLabel.text = bars[indexPath.row].name!
        
        // Configure the cell...

        return cell
    }
 

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        if segue.identifier?.elementsEqual("listToMap") == true{
            if let destinationVC = segue.destination as? MapViewController {
                destinationVC.bars = [bars[self.tableView.indexPathForSelectedRow?.row ?? 0]]
            }
        }
    }

}

extension BarsTableViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        currentLocation = (locations as NSArray).lastObject as! CLLocation
        manager.stopUpdatingLocation()
        
    }
}


