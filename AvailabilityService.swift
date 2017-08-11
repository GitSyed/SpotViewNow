//
//  AvailabilityService.swift
//  SpotView
//
//  Created by Syed Muneeb  on 7/24/17.
//  Copyright © 2017 Slim School. All rights reserved.
//

import Foundation
import FirebaseDatabase

class AvailabilityService {
    static func listenForChanges(forChairsAndTables chairsAndTables: [String], completionHandler: @escaping (DataSnapshot) -> Void) {
        for object in chairsAndTables {
            
            let ref = Database.database().reference().child(object)
            ref.observe(.value, with: { (snapshot) in
                completionHandler(snapshot)
            })
            //observe every chair and table
            //send the snapshot to closure
        }
    }
    

}









































//Tap gesture recognizer in viewdidload for keyboard to go down
 // func handleTap(_gestureRecognizer: UIGestureRecognizer), add UI GestureRecognizerDelegate at the top(
//  textField.addGestureRecognizer
//)
//command shift K
