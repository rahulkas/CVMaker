//
//  CompanyInfoViewModel.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 12/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation

struct CompanyInfoViewModel {
    
    var companyName : String?
    var designation: String?
    var experience: String?
    var companyDetailArray = [Any]()
    
    
    init() {
        
    }
    
    mutating func saveData(){
        ModelClasses.sharedInstance.currentCompanyDetailsObject.companyName = companyName ?? ""
        ModelClasses.sharedInstance.currentCompanyDetailsObject.designation = designation ?? ""
        ModelClasses.sharedInstance.currentCompanyDetailsObject.experience = experience ?? ""
        
        companyDetailArray.append(ModelClasses.sharedInstance.currentCompanyDetailsObject)
    }
}
