//
//  AreaOfExpertiseModel.swift
//  CVMaker
//
//  Created by Rahul Kashyap on 12/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import Foundation

struct AreaOfExpertiseModel {
    
     var areaOfExpertise1: String?
     var experience1: String?
    
     var areaOfExpertise2: String?
     var experience2: String?
    
     var areaOfExpertise3: String?
     var experience3: String?
    
     var areaOfExpertise4: String?
     var experience4: String?
    
     var areaOfExpertise5: String?
     var experience5: String?
    
     var aditionalInformation: String?
    
    init() {}
    
    func saveData(){
        
        var areaOfExpertiseDictionary:[String:String] = [:]
        var areaOfExpertiseArray = [[String:String]]();
        
        //Retrieving and storing data to Singleton classes
        if let areaOfExpertise = areaOfExpertise1{
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.areaOfExpertise = areaOfExpertise
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.experience = experience1 ?? ""
            
            //Converting to Dict for saving
            areaOfExpertiseDictionary = ModelClasses.sharedInstance.getTopicsOfKnowledgeDict(tok:ModelClasses.sharedInstance.topicsOfKnowledgeObject)
            
            //Adding as an Array since many course can be added
            areaOfExpertiseArray.append(areaOfExpertiseDictionary)
        }
        
        //Retrieving and storing data to Singleton classes
        if let areaOfExpertise = areaOfExpertise2{
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.areaOfExpertise = areaOfExpertise
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.experience = experience2 ?? ""
            
            //Converting to Dict for saving
            areaOfExpertiseDictionary = ModelClasses.sharedInstance.getTopicsOfKnowledgeDict(tok:ModelClasses.sharedInstance.topicsOfKnowledgeObject)
            
            //Adding as an Array since many course can be added
            areaOfExpertiseArray.append(areaOfExpertiseDictionary)
        }
        
        //Retrieving and storing data to Singleton classes
        if let areaOfExpertise = areaOfExpertise3{
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.areaOfExpertise = areaOfExpertise
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.experience = experience3 ?? ""
            
            //Converting to Dict for saving
            areaOfExpertiseDictionary = ModelClasses.sharedInstance.getTopicsOfKnowledgeDict(tok:ModelClasses.sharedInstance.topicsOfKnowledgeObject)
            
            //Adding as an Array since many course can be added
            areaOfExpertiseArray.append(areaOfExpertiseDictionary)
        }
        
        //Retrieving and storing data to Singleton classes
        if let areaOfExpertise = areaOfExpertise4{
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.areaOfExpertise = areaOfExpertise
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.experience = experience4 ?? ""
            
            //Converting to Dict for saving
            areaOfExpertiseDictionary = ModelClasses.sharedInstance.getTopicsOfKnowledgeDict(tok:ModelClasses.sharedInstance.topicsOfKnowledgeObject)
            
            //Adding as an Array since many course can be added
            areaOfExpertiseArray.append(areaOfExpertiseDictionary)
        }
        //Retrieving and storing data to Singleton classes
        if let areaOfExpertise = areaOfExpertise5{
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.areaOfExpertise = areaOfExpertise
            ModelClasses.sharedInstance.topicsOfKnowledgeObject.experience = experience5 ?? ""
            
            //Converting to Dict for saving
            areaOfExpertiseDictionary = ModelClasses.sharedInstance.getTopicsOfKnowledgeDict(tok:ModelClasses.sharedInstance.topicsOfKnowledgeObject)
            
            //Adding as an Array since many course can be added
            areaOfExpertiseArray.append(areaOfExpertiseDictionary)
        }
    
        
        //Saving it to Singleton Object
        ResumeDataModel.sharedInstance.areaOfExpertise = areaOfExpertiseArray

    }
    
}
