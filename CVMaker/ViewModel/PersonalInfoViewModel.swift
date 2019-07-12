//
//  PersonalInfoViewModel.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 11/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation

struct PersonalInfoViewModel {
    
    var firstName : String?
    var lastName : String?
    var mobileNumber : String?
    var emailID : String?
    var address1 : String?
    var address2 : String?
    var dob : String?
    
    init() {
    }
    
    func saveData() {
        
        //Saving PersonalInfo to ModelClass
        ModelClasses.sharedInstance.personalInfoObject.firstName = firstName ?? ""
        ModelClasses.sharedInstance.personalInfoObject.lastName = lastName ?? ""
        ModelClasses.sharedInstance.personalInfoObject.phoneNumber = mobileNumber ?? ""
        ModelClasses.sharedInstance.personalInfoObject.emailId = emailID ?? ""
        ModelClasses.sharedInstance.personalInfoObject.address1 = address1 ?? ""
        ModelClasses.sharedInstance.personalInfoObject.address2 = address2 ?? ""
        ModelClasses.sharedInstance.personalInfoObject.dob  = dob ?? ""
    }
}
