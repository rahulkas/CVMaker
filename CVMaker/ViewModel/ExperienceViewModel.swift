//
//  ExperienceViewModel.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 12/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation

struct ExperienceViewModel {
    
    var companyName: String?
    var projectName: String?
    var startDate: String?
    var endDate: String?
    var technology : String?
    var experinceDetailArray = [Any]()
 
    
    init() {
        
    }
    
    mutating func saveData(){
        ModelClasses.sharedInstance.experinceDetailsObject.companyName = companyName ?? ""
        ModelClasses.sharedInstance.experinceDetailsObject.projectName = projectName ?? ""
        ModelClasses.sharedInstance.experinceDetailsObject.startDate = startDate ?? ""
        ModelClasses.sharedInstance.experinceDetailsObject.endDate = endDate ?? ""
        ModelClasses.sharedInstance.experinceDetailsObject.technology = technology ?? ""
        
        //Converting to Dictionary for saving
        let experinceDictionary = ModelClasses.sharedInstance.getProjectDetailsDict(experince: ModelClasses.sharedInstance.experinceDetailsObject)
        experinceDetailArray.append(experinceDictionary)
    }
}
