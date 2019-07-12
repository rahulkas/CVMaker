//
//  ResumeModel.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 12/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation

class ResumeDataModel:NSObject
{
    var personalInfo:[String:String] = [:]
    var education:[[String:String]] = []
    var areaOfExpertise:[[String:String]] = []
    var experience:[[String:String]] = []
    var company:[String:String] = [:]
    
    static let sharedInstance = ResumeDataModel()
    
    //Converting to Dict
    func getResumeDataDictionary() -> [String:Any] {
        return["personalInfo":personalInfo,
               "education":education,
               "areaOfExpertise":areaOfExpertise,
               "experience":experience,
               "company":company,
        ] ;
    }
    //Retrieve from Dict
    func setResumeDataDictionary(data:[String:Any]) {
        personalInfo = data["personalInfo"] as? [String:String] ?? [:]
        education = data["education"] as? [[String:String]] ?? []
        areaOfExpertise = data["areaOfExpertise"] as? [[String:String]] ?? []
        experience = data["experience"] as? [[String:String]] ?? []
        company = data["company"] as? [String:String] ?? [:]
    }
    
    
    
}
