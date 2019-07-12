//
//  AreaOfExpertiseViewController.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 10/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import UIKit

class AreaOfExpertiseViewController: BaseViewController {

    @IBOutlet weak var areaOfExpertise1: UITextField!
    @IBOutlet weak var experience1: UITextField!
    
    @IBOutlet weak var areaOfExpertise2: UITextField!
    @IBOutlet weak var experience2: UITextField!
    
    @IBOutlet weak var areaOfExpertise3: UITextField!
    @IBOutlet weak var experience3: UITextField!
    
    @IBOutlet weak var areaOfExpertise4: UITextField!
    @IBOutlet weak var experience4: UITextField!
    
    @IBOutlet weak var areaOfExpertise5: UITextField!
    @IBOutlet weak var experience5: UITextField!
    
    @IBOutlet weak var aditionalInformation: UITextField!
    
    var areaOfexpertiseModel : AreaOfExpertiseModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup(){
        self.navigationItem.title = "Area of Expertise"
        setLeftNavigationItem(title: "Back")

        experience1.delegate = self
        experience2.delegate = self
        experience3.delegate = self
        experience4.delegate = self
        experience5.delegate = self
        areaOfexpertiseModel = AreaOfExpertiseModel()
        saveDelegate = self
    }
    
    
    func saveAreaOfExpertiseData() {
        areaOfexpertiseModel?.areaOfExpertise1 = areaOfExpertise1.text
        areaOfexpertiseModel?.experience1 = experience1.text
        
        areaOfexpertiseModel?.areaOfExpertise2 = areaOfExpertise2.text
        areaOfexpertiseModel?.experience2 = experience2.text
        
        areaOfexpertiseModel?.areaOfExpertise3 = areaOfExpertise3.text
        areaOfexpertiseModel?.experience3 = experience3.text
        
        areaOfexpertiseModel?.areaOfExpertise4 = areaOfExpertise4.text
        areaOfexpertiseModel?.experience4 = experience4.text
        
        areaOfexpertiseModel?.areaOfExpertise5 = areaOfExpertise5.text
        areaOfexpertiseModel?.experience5 = experience5.text
        
        areaOfexpertiseModel?.aditionalInformation = aditionalInformation.text
        
        areaOfexpertiseModel?.saveData()
        self.navigationController?.popViewController(animated: true)
    }


}

extension AreaOfExpertiseViewController : saveProtocol{
    func saveObject() {
        saveAreaOfExpertiseData()
    }
    
    func writeToUrl() {
        
    }
    
    
}

extension AreaOfExpertiseViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string.isNumber){
            return true
        }
        else
        {
            return false
        }
    }
    
}
