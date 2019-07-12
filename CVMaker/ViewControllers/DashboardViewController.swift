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
        self.navigationItem.title = "Dashboard"
        saveDelegate = self
        setRightNavigationItem(title: "Save")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createCVButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "homeSegue", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
    //Saving data to server
    private func finalSave()
    {
        var url:URL
        
        url = Utility.sharedInstance.getDocumentsDirectory()
        
        //Calling network methods for save
        NetworkManager.sharedInstance.requestForWriting(url: url, dataDict: ResumeDataModel.sharedInstance.getResumeDataDictionary(), completionHandlers:({(data:[String:Any]?,url:URLResponse?,error:Error?) in
            
            if let _ = error{
                print("Error while Saving")
                Utility.sharedInstance.showAlert(title: "Error", msg: "Error while Saving")
            }
            else{
                Utility.sharedInstance.showAlert(title: "Success", msg: "Data Saved Successfully")
                
            }
        }))
    }
}

extension DashboardViewController : saveProtocol{
    func saveObject() {
        
    }
    
    func writeToUrl() {
        finalSave()
    }
    
    
}

