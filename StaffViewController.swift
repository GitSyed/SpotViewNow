//
//  StaffViewController.swift
//  SpotView
//
//  Created by Syed Muneeb  on 7/17/17.
//  Copyright © 2017 Slim School. All rights reserved.
// <a href="https://icons8.com/icon/26116/Chair">
// <a href="https://icons8.com/icon/22218/Barber-Chair">
// <a href="https://icons8.com/icon/41564/Main-Gate-Closed-Filled">

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class StaffViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var isStaffMode = false
    
    var timer: Timer?
    
    //master branch refrence
    var masterBranch: DatabaseReference!
    
    //Outlets
    
    @IBOutlet weak var updatedTime: UILabel!
    
    let formatter: DateFormatter = {
        let tmpFormatter = DateFormatter()
        tmpFormatter.dateFormat = "hh:mm a"
        return tmpFormatter
        }()
    
    private var button: UIButton = {
        let minimumTappableHeight: CGFloat = 44
        let button = UIButton(frame: CGRect(x: 0, y: 0,
                                            width: minimumTappableHeight,
                                            height: minimumTappableHeight))
        
        
        
        return button
    }()

    
    
    //MARK: TABLE 1
    
    @IBOutlet weak var table1Button: UIButton!
    
    @IBOutlet weak var chair1Top: UIButton!
    
    @IBOutlet weak var chair1Bottom: UIButton!
    
    //TABLE 2
    
    @IBOutlet weak var table2Button: UIButton!
    
    @IBOutlet weak var chair2a: UIButton!
    
    @IBOutlet weak var chair2b: UIButton!
    
    @IBOutlet weak var chair2c: UIButton!
    
    @IBOutlet weak var chair2d: UIButton!
    
    @IBOutlet weak var chair2e: UIButton!
    
    @IBOutlet weak var table3Button: UIButton!
    
    @IBOutlet weak var chair3a: UIButton!
    
    @IBOutlet weak var chair3b: UIButton!
    
    @IBOutlet weak var chair3c: UIButton!
    
    @IBOutlet weak var chair3d: UIButton!
    
    @IBOutlet weak var chair3e: UIButton!
    
    @IBOutlet weak var chair3f: UIButton!
    
    @IBOutlet weak var chair3g: UIButton!
    
    @IBOutlet weak var chair3h: UIButton!
    
    @IBOutlet weak var table4Button: UIButton!
    
    @IBOutlet weak var chair4Top: UIButton!
    
    @IBOutlet weak var chair4Bottom: UIButton!
    
    @IBOutlet weak var table5Button: UIButton!
    
    @IBOutlet weak var chair5Top: UIButton!
    
    @IBOutlet weak var chair5Bottom: UIButton!
    
    @IBOutlet weak var table6Button: UIButton!
    
    @IBOutlet weak var chair6Top: UIButton!
    
    @IBOutlet weak var chair6Left: UIButton!
    
    @IBOutlet weak var chair6Bottom: UIButton!
    
    @IBOutlet weak var table7Button: UIButton!
    
    @IBOutlet weak var chair7Top: UIButton!
    
    @IBOutlet weak var chair7Bottom: UIButton!
    
    @IBOutlet weak var table8Button: UIButton!
    
    @IBOutlet weak var chair8Top: UIButton!
    
    @IBOutlet weak var chair8Bottom: UIButton!
    
    @IBOutlet weak var table9: UIButton!
    
    @IBOutlet weak var chair9Top: UIButton!
    
    @IBOutlet weak var chair9Bottom: UIButton!
    
    var location = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.getTimeOfDate), userInfo: nil, repeats: true)
        
//        view.addSubview(chair1Top)
//        chair1Top.addTarget(self,
//                            action: #selector(chair1TopTapped(_:)),
//                             for: UIControlEvents.touchDragInside)
//        chair1Top.addTarget(self,
//                            action: #selector(chair1TopTapped(_:)),
//                             for: [UIControlEvents.touchDragExit,
//                                   UIControlEvents.touchDragOutside])
//        
//        view.addSubview(chair1Bottom)
//        chair1Bottom.addTarget(self,
//                             action: #selector(chair1BottomTapped(_:)),
//                              for: UIControlEvents.touchDragInside)
//        chair1Bottom.addTarget(self,
//                             action: #selector(chair1BottomTapped(_:)),
//                              for: [UIControlEvents.touchDragExit,
//                                    UIControlEvents.touchDragOutside])
        
        self.table1Button.isUserInteractionEnabled = isStaffMode
        self.chair1Top.isUserInteractionEnabled = isStaffMode
        self.chair1Bottom.isUserInteractionEnabled = isStaffMode
        self.table2Button.isUserInteractionEnabled = isStaffMode
        self.chair2a.isUserInteractionEnabled = isStaffMode
        self.chair2b.isUserInteractionEnabled = isStaffMode
        self.chair2c.isUserInteractionEnabled = isStaffMode
        self.chair2d.isUserInteractionEnabled = isStaffMode
        self.chair2e.isUserInteractionEnabled = isStaffMode
        self.table3Button.isUserInteractionEnabled = isStaffMode
        self.chair3a.isUserInteractionEnabled = isStaffMode
        self.chair3b.isUserInteractionEnabled = isStaffMode
        self.chair3c.isUserInteractionEnabled = isStaffMode
        self.chair3d.isUserInteractionEnabled = isStaffMode
        self.chair3e.isUserInteractionEnabled = isStaffMode
        self.chair3f.isUserInteractionEnabled = isStaffMode
        self.chair3g.isUserInteractionEnabled = isStaffMode
        self.chair3h.isUserInteractionEnabled = isStaffMode
        self.table4Button.isUserInteractionEnabled = isStaffMode
        self.chair4Top.isUserInteractionEnabled = isStaffMode
        self.chair4Bottom.isUserInteractionEnabled = isStaffMode
        self.table5Button.isUserInteractionEnabled = isStaffMode
        self.chair5Top.isUserInteractionEnabled = isStaffMode
        self.chair5Bottom.isUserInteractionEnabled = isStaffMode
        self.table6Button.isUserInteractionEnabled = isStaffMode
        self.chair6Top.isUserInteractionEnabled = isStaffMode
        self.chair6Left.isUserInteractionEnabled = isStaffMode
        self.chair6Bottom.isUserInteractionEnabled = isStaffMode
        self.table7Button.isUserInteractionEnabled = isStaffMode
        self.chair7Top.isUserInteractionEnabled = isStaffMode
        self.chair7Bottom.isUserInteractionEnabled = isStaffMode
        self.table7Button.isUserInteractionEnabled = isStaffMode
        self.chair7Top.isUserInteractionEnabled = isStaffMode
        self.chair7Bottom.isUserInteractionEnabled = isStaffMode
        self.table8Button.isUserInteractionEnabled = isStaffMode
        self.chair8Top.isUserInteractionEnabled = isStaffMode
        self.chair8Bottom.isUserInteractionEnabled = isStaffMode
        self.table9.isUserInteractionEnabled = isStaffMode
        self.chair9Top.isUserInteractionEnabled = isStaffMode
        self.chair9Bottom.isUserInteractionEnabled = isStaffMode
        
        //set up masterBranch with child of "Button"
        masterBranch =  Database.database().reference()
        
        //set up button color as what says on firebase
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { (connected) in
            if let boolean = connected.value as? Bool, boolean == true {
                //connected, getting color of button with observer
                print("connected")
                
                
            //    let chairsAndTables  = ["Chair1Top", "Chair1Bottom", "Chair2a"]
                
//                AvailabilityService.listenForChanges(forChairsAndTables: chairsAndTables, completionHandler: { (snapshot) in
//                    //check snapshot.key -> this should be equal to button title
//                    //update UI at button named snapshot.key
//                    
//                    let buttonTitle = snapshot.key as? String
//                    let button = UIButton()
//                    button = button as?
//                })
                
                
                    self.masterBranch.observe(.value, with: { snapshot in
                
                    
                    var colorChangedToGreen = snapshot.childSnapshot(forPath: "Table1").value as? Bool
                    self.table1Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair1Top").value as? Bool
                    self.chair1Top.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair1Bottom").value as? Bool
                    self.chair1Bottom.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table2").value as? Bool
                    self.table2Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair2a").value as? Bool
                    self.chair2a.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair2b").value as? Bool
                        self.chair2b.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair2c").value as? Bool
                    self.chair2c.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair2d").value as? Bool
                    self.chair2d.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)

                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair2e").value as? Bool
                    self.chair2e.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table3").value as? Bool
                    self.table3Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3a").value as? Bool
                    self.chair3a.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3b").value as? Bool
                    self.chair3b.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)

                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3c").value as? Bool
                    self.chair3c.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3d").value as? Bool
                    self.chair3d.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3e").value as? Bool
                    self.chair3e.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3f").value as? Bool
                    self.chair3f.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3g").value as? Bool
                    self.chair3g.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair3h").value as? Bool
                    self.chair3h.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table4").value as? Bool
                    self.table4Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair4Top").value as? Bool
                    self.chair4Top.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair4Bottom").value as? Bool
                    self.chair4Bottom.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table5").value as? Bool
                    self.table5Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair5Top").value as? Bool
                    self.chair5Top.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair5Bottom").value as? Bool
                    self.chair5Bottom.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table6").value as? Bool
                    self.table6Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair6Top").value as? Bool
                    self.chair6Top.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair6Left").value as? Bool
                    self.chair6Left.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair6Bottom").value as? Bool
                    self.chair6Bottom.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table7").value as? Bool
                    self.table7Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair7Top").value as? Bool
                    self.chair7Top.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair7Bottom").value as? Bool
                    self.chair7Bottom.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table8").value as? Bool
                    self.table8Button.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair8Top").value as? Bool
                    self.chair8Top.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair8Bottom").value as? Bool
                    self.chair8Bottom.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Table9").value as? Bool
                    self.table9.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0): UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair9Top").value as? Bool
                    self.chair9Top.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    colorChangedToGreen = snapshot.childSnapshot(forPath: "Chair9Bottom").value as? Bool
                    self.chair9Bottom.backgroundColor = (colorChangedToGreen)! ? UIColor(red:0.29, green:0.78, blue:0.47, alpha:1.0) : UIColor(red:0.86, green:0.27, blue:0.22, alpha:1.0)
                    
                    
                    print("observing")
                })
            } else {
                //not connected
                print("not connected")
                self.table1Button.backgroundColor = UIColor.gray
                self.table2Button.backgroundColor = UIColor.gray
                self.table3Button.backgroundColor = UIColor.gray
                self.table4Button.backgroundColor = UIColor.gray
                self.table5Button.backgroundColor = UIColor.gray
                self.table6Button.backgroundColor = UIColor.gray
                self.table7Button.backgroundColor = UIColor.gray
                self.table8Button.backgroundColor = UIColor.gray
                self.table9.backgroundColor = UIColor.gray
            }
        })
        
    }
    
    
//    func changeAvailabilty(button: UIButton) {
//       self.button.backgroundColor = (colorChangedToGreen)! ? UIColor.green : UIColor.red
//    }
  
    
   //ACTIONS
    
    @IBAction func table1Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table1").value as? Bool
            
            self.masterBranch.child("Table1").setValue(!colorGreen!)
            self.masterBranch.child("Chair1Top").setValue(!colorGreen!)
            self.masterBranch.child("Chair1Bottom").setValue(!colorGreen!)

            
        })
        
    }
    
    @IBAction func chair1TopTapped(_ sender: UIButton) {
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair1Top").value as? Bool
            
            self.masterBranch.child("Chair1Top").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair1BottomTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair1Bottom").value as? Bool
            
            self.masterBranch.child("Chair1Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func table2Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table2").value as? Bool
            
            self.masterBranch.child("Table2").setValue(!colorGreen!)
            self.masterBranch.child("Chair2a").setValue(!colorGreen!)
            self.masterBranch.child("Chair2b").setValue(!colorGreen!)
            self.masterBranch.child("Chair2c").setValue(!colorGreen!)
            self.masterBranch.child("Chair2d").setValue(!colorGreen!)
            self.masterBranch.child("Chair2e").setValue(!colorGreen!)
        })
        
    }
    
    
    @IBAction func chair2ATapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair2a").value as? Bool
            
            self.masterBranch.child("Chair2a").setValue(!colorGreen!)
            
            
        })

    }
    
    
    @IBAction func chair2BTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair2b").value as? Bool
            
            self.masterBranch.child("Chair2b").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair2CTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair2c").value as? Bool
            
            self.masterBranch.child("Chair2c").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair2DTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair2d").value as? Bool
            
            self.masterBranch.child("Chair2d").setValue(!colorGreen!)
            
            
        })
    }
    
    
    @IBAction func chair2ETapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair2e").value as? Bool
            
            self.masterBranch.child("Chair2e").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func table3Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table3").value as? Bool
            
            self.masterBranch.child("Table3").setValue(!colorGreen!)
            self.masterBranch.child("Chair3a").setValue(!colorGreen!)
            self.masterBranch.child("Chair3b").setValue(!colorGreen!)
            self.masterBranch.child("Chair3c").setValue(!colorGreen!)
            self.masterBranch.child("Chair3d").setValue(!colorGreen!)
            self.masterBranch.child("Chair3e").setValue(!colorGreen!)
            self.masterBranch.child("Chair3f").setValue(!colorGreen!)
            self.masterBranch.child("Chair3g").setValue(!colorGreen!)
            self.masterBranch.child("Chair3h").setValue(!colorGreen!)
        })

    }
    
    @IBAction func chair3ATapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3a").value as? Bool
            
            self.masterBranch.child("Chair3a").setValue(!colorGreen!)
            
            
        })

    }
    
    @IBAction func chair3BTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3b").value as? Bool
            
            self.masterBranch.child("Chair3b").setValue(!colorGreen!)
            
            
        })

    }
    
    @IBAction func chair3CTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3c").value as? Bool
            
            self.masterBranch.child("Chair3c").setValue(!colorGreen!)
            
            
        })

    }
    
    @IBAction func chair3DTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3d").value as? Bool
            
            self.masterBranch.child("Chair3d").setValue(!colorGreen!)
            
            
        })

    }
    
   
    @IBAction func chair3ETapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3e").value as? Bool
            
            self.masterBranch.child("Chair3e").setValue(!colorGreen!)
            
        })

    }
    
    @IBAction func chair3FTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3f").value as? Bool
            
            self.masterBranch.child("Chair3f").setValue(!colorGreen!)
            
            
        })

    }
    
    @IBAction func chair3GTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3g").value as? Bool
            
            self.masterBranch.child("Chair3g").setValue(!colorGreen!)
            
            
        })

    }
    
    @IBAction func chair3HTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair3h").value as? Bool
            
            self.masterBranch.child("Chair3h").setValue(!colorGreen!)
            
            
        })

    }
    
    
    @IBAction func table4Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table4").value as? Bool
            
            self.masterBranch.child("Table4").setValue(!colorGreen!)
            self.masterBranch.child("Chair4Top").setValue(!colorGreen!)
            self.masterBranch.child("Chair4Bottom").setValue(!colorGreen!)
            
            
        })

    }
    
    @IBAction func chair4TopTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair4Top").value as? Bool
            
            self.masterBranch.child("Chair4Top").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair4BottomTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair4Bottom").value as? Bool
            
            self.masterBranch.child("Chair4Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    
    @IBAction func table5Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table5").value as? Bool
            
            self.masterBranch.child("Table5").setValue(!colorGreen!)
            self.masterBranch.child("Chair5Top").setValue(!colorGreen!)
            self.masterBranch.child("Chair5Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair5TopTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair5Top").value as? Bool
            
            self.masterBranch.child("Chair5Top").setValue(!colorGreen!)
            
            
        })
    }
    
    
    @IBAction func chair5BottomTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair5Bottom").value as? Bool
            
            self.masterBranch.child("Chair5Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func table6Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table6").value as? Bool
            
            self.masterBranch.child("Table6").setValue(!colorGreen!)
            self.masterBranch.child("Chair6Top").setValue(!colorGreen!)
            self.masterBranch.child("Chair6Left").setValue(!colorGreen!)
            self.masterBranch.child("Chair6Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair6TopTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair6Top").value as? Bool
            
            self.masterBranch.child("Chair6Top").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair6LeftTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair6Left").value as? Bool
            
            self.masterBranch.child("Chair6Left").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair6BottomTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair6Bottom").value as? Bool
            
            self.masterBranch.child("Chair6Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    
    @IBAction func table7Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table7").value as? Bool
            
            self.masterBranch.child("Table7").setValue(!colorGreen!)
            self.masterBranch.child("Chair7Top").setValue(!colorGreen!)
            self.masterBranch.child("Chair7Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair7TopTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair7Top").value as? Bool
            
            self.masterBranch.child("Chair7Top").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair7BottomTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair7Bottom").value as? Bool
            
            self.masterBranch.child("Chair7Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    
    @IBAction func table8Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table8").value as? Bool
            
            self.masterBranch.child("Table8").setValue(!colorGreen!)
            self.masterBranch.child("Chair8Top").setValue(!colorGreen!)
            self.masterBranch.child("Chair8Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair8TopTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair8Top").value as? Bool
            
            self.masterBranch.child("Chair8Top").setValue(!colorGreen!)
            
            
        })
    }
   
    @IBAction func chair8BottomTapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair8Bottom").value as? Bool
            
            self.masterBranch.child("Chair8Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    
    @IBAction func table9Tapped(_ sender: UIButton) {
        
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Table9").value as? Bool
            
            self.masterBranch.child("Table9").setValue(!colorGreen!)
            self.masterBranch.child("Chair9Top").setValue(!colorGreen!)
            self.masterBranch.child("Chair9Bottom").setValue(!colorGreen!)
            
            
        })
        
    }
    
    @IBAction func chair9TopTapped(_ sender: UIButton) {
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair9Top").value as? Bool
            
            self.masterBranch.child("Chair9Top").setValue(!colorGreen!)
            
            
        })
    }
    
    @IBAction func chair9BottomTapped(_ sender: UIButton) {
        //get snapshot and change value to inverse
        self.masterBranch.observeSingleEvent(of: .value, with: { snapshot in
            
            let colorGreen = snapshot.childSnapshot(forPath: "Chair9Bottom").value as? Bool
            
            self.masterBranch.child("Chair9Bottom").setValue(!colorGreen!)
            
            
        })
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
   
    
    
 //   var timer: Timer?
    
   // let formatter: DateFormatter = {
       // let tmpFormatter = DateFormatter()
        //tmpFormatter.dateFormat = "hh:mm a"
        //return tmpFormatter
    //}()

//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.getTimeOfDate), userInfo: nil, repeats: true)
//        
//        
//    }
//    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
    }
//    
    func getTimeOfDate() {
    let curDate = Date()
//        
    updatedTime.text = formatter.string(from: curDate)
//        
    }
    
        
}




