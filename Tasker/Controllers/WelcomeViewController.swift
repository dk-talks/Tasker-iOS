//
//  WelcomeViewController.swift
//  Todoey
//
//  Created by Dinesh Sharma on 27/03/23.
//  Copyright © 2023 Philipp Muellauer. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(defaults.bool(forKey: "isStarted")) {
            if let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController {
                navigationController?.pushViewController(homeVC, animated: false)
            }
        }
    }
    

    @IBAction func btnStart(_ sender: Any) {
        defaults.set(true, forKey: "isStarted")
    }
    
}
