//
//  EducationInfoViewModel.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 11/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation

struct EducationInfoViewModel {
    
    var universsityName: String?
    var courseName: String?
    var fromDate: String?
    var toDate: String?
    var educationDetailArray = [Any]()
    
    init() {
        
    }
    
    mutating func saveData(){
        ModelClasses.sharedInstance.educationalInfoObject.universityName = universsityName ?? ""
        ModelClasses.sharedInstance.educationalInfoObject.courseName = courseName ?? ""
        ModelClasses.sharedInstance.educationalInfoObject.fromDate = fromDate ?? ""
        ModelClasses.sharedInstance.educationalInfoObject.toDate = toDate ?? ""
        
        //Converting to Dictionary for saving
        let educationDictionary = ModelClasses.sharedInstance.getEducationalInfoDict(educationalInfo: ModelClasses.sharedInstance.educationalInfoObject)
        educationDetailArray.append(educationDictionary)
    }
}
