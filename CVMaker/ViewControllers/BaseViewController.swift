//
//  ViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 06/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Single Navigation item - Right bar item - Save
    func setRightNavigationItem(title:String) -> Void {
        
        let saveBarButtonItem = UIBarButtonItem.init(title: title, style: .done, target: self, action: #selector(saveSelector))
        self.navigationItem.rightBarButtonItem = saveBarButtonItem
        
    }
    //Single Navigation item - Left bar item - Back
    func setLeftNavigationItem(title:String) -> Void {
        
        let backBarButtonItem = UIBarButtonItem.init(title: title, style: .plain, target: self, action: #selector(backButtonSelector))
        self.navigationItem.leftBarButtonItem = backBarButtonItem
        
    }
    
    var saveDelegate:saveProtocol?
    
    //Save button Action
    @objc func saveSelector() {
        saveDelegate?.writeToUrl()
    }
    
    //Back button Action
    @objc func backButtonSelector() {
        saveDelegate?.saveObject()
    }

}

protocol saveProtocol {
    func saveObject()
    func writeToUrl()
    
}
