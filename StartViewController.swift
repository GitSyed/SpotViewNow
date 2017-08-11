//
//  StartViewController.swift
//  SpotView
//
//  Created by Syed Muneeb  on 7/20/17.
//  Copyright © 2017 Slim School. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation


class StartViewController: UIViewController, CLLocationManagerDelegate {
    
    private var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStaffView"{
        
            let destinationController = segue.destination as! StaffViewController
            destinationController.isStaffMode = true
        
        }
        if segue.identifier == "toCustomerView"{
            
            let destinationController = segue.destination as! StaffViewController
            destinationController.isStaffMode = false
         
        }
    }
    
    
    @IBOutlet weak var staffViewButton: UIButton!

    @IBOutlet weak var customerViewButton: UIButton!
    
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("didFailWithError: \(error.description)")
        let errorAlert = UIAlertView(title: "Error", message: "Failed to Get Your Location", delegate: nil, cancelButtonTitle: "Ok")
        errorAlert.show()
    }

}
