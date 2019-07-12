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
        
        //Converting to Dict for saving
        ResumeDataModel.sharedInstance.personalInfo = ModelClasses.sharedInstance.getPersonalInfoDict()
    }
    
    mutating func loadData(){
        
        //Loading data from retrieved URL data
        
        ModelClasses.sharedInstance.personalInfoObject = ModelClasses.sharedInstance.setPersonalInfoDict(data: ResumeDataModel.sharedInstance.personalInfo)
        
        firstName = ModelClasses.sharedInstance.personalInfoObject.firstName
        lastName = ModelClasses.sharedInstance.personalInfoObject.lastName
        mobileNumber = ModelClasses.sharedInstance.personalInfoObject.phoneNumber
        emailID = ModelClasses.sharedInstance.personalInfoObject.emailId
        address1 = ModelClasses.sharedInstance.personalInfoObject.address1
        address2 = ModelClasses.sharedInstance.personalInfoObject.address2
        dob = ModelClasses.sharedInstance.personalInfoObject.dob
        
    }
}
