//
//  LoginViewController.swift
//  SpotView
//
//  Created by Syed Muneeb  on 7/13/17.
//  Copyright © 2017 Slim School. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
            }
    
    @IBAction func LoginButtonTapped(_ sender: UIButton) {
        
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
                UserService.show(forUID: user!.uid) { (user) in
                    if let user = user {
                        // handle existing user
                        User.setCurrent(user, writeToUserDefaults: true)
                        let initialViewController = UIStoryboard.initialViewController(for: .main)
                        self.view.window?.rootViewController = initialViewController
                        self.view.window?.makeKeyAndVisible()
                    } else {
                        // handle new user
                        self.performSegue(withIdentifier: "ToStaffMenu", sender: self)
                    }
            }
            
        }
        guard let user = user
            else {
                return }
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                
                User.setCurrent(user, writeToUserDefaults: true)
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                //handle new user
                    self.performSegue(withIdentifier: "ToStaffMenu", sender: self)
            }
        }
        
    }
}

        

