//
//  ResumeDataModelTests.swift
//  CVMakerTests
//
//  Created by Rahul Kashyap on 17/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import XCTest
@testable import CVMaker

class ResumeDataModelTests: XCTestCase {
    
    var resumeDictionary : [String : Any]?

    override func setUp() {
        super.setUp()
        //Dummy Array of Dictionary
        resumeDictionary = ["personalInfo" : ["firstName" : "Rahul","lastName" : "Kashyap", "mobile" : "8237689959"],
                            "education" : ["universityName":"CSVTU","courseName":"BE","fromDate":"2013","toDate":"2018"],
                            "experience" : ["companyName":"ABC","projectName":"xyz","technology":"qwe"],
                            "company" : ["companeName":"asd","designation":"developer","experience":"3"],
                            "areaOfExpertise" : ["areaOfExpertise1":"swift","experience1":"4"]]
    }

    override func tearDown() {
        super.tearDown()
        resumeDictionary = nil
    }
    
    func testSetAndGetResumeDataDictionary(){
        
        ResumeDataModel.sharedInstance.setResumeDataDictionary(data: resumeDictionary!)
        let dictionary = ResumeDataModel.sharedInstance.getResumeDataDictionary()
        XCTAssertNotNil(dictionary)
        
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
