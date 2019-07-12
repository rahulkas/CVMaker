//
//  DashboardViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class DashboardViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createCVButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "homeSegue", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}

