//
//  LocationViewController.swift
//  SpotView
//
//  Created by Syed Muneeb on 8/3/17.
//  Copyright © 2017 Slim School. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {
    
    var starbucksLatitude = 0
    var starbucksLongitude = 0
    
    @IBOutlet weak var firstPin: UITextField!
    
    @IBOutlet weak var secondPin: UITextField!
    
    @IBOutlet weak var verifyButton: UIButton!
    
    @IBAction func verifyButton(_ sender: UIButton) {
        
    }
    
    // use  allocation to get current location
    // have max radius (max distance from starbucks coordinates)
    // get distance between two coordinates
    // if distance is within radius
       // segue to pass code vc
                            
    //create location manager
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        verifyButton.isEnabled = false
        firstPin.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        secondPin.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        
    func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
        func editingChanged(_ textField: UITextField) {
            if firstPin.text?.characters.count == 4 {
                if secondPin.text?.characters.first == " " {
                    
                    return
                }
            }
            guard
                let first = firstPin.text, !first.isEmpty,
                let second = secondPin.text, !second.isEmpty,

                else {
                    self.verifyButton.isEnabled = false
                    return
            }
            verifyButton.isEnabled = true
        }
        
        
}
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location:CLLocationCoordinate2D = manager.location!.coordinate
        starbucksLatitude = Int(location.latitude)
        starbucksLongitude = Int(location.longitude)
    }
/*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
