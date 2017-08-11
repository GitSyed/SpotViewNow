//
//  CreateStaffUserName.swift
//  SpotView
//
//  Created by Syed Muneeb  on 7/13/17.
//  Copyright © 2017 Slim School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateStaffUserNameViewController: UIViewController {
    
    @IBOutlet weak var staffUserName: UITextField!
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = staffUserName.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else{
                return
            }
            
            print("Created new user: \(user.username)")
        }
        
        let userAttrs = ["username": username]
        
        let ref = Database.database().reference().child("users").child(firUser.uid)
        
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return
            }
            
            // 5
            
            // handle newly created user here
            
            
            UserService.create(firUser, username: username) { (user) in
                guard let user = user else {
                    //handle error
                    return
                }
                User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
                
            }
            
        }
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("testing a")
        //nextButton.layer.cornerRadius = 6
        
    }
}
