//
//  UtilityTests.swift
//  CVMakerTests
//
//  Created by Rahul Kashyap on 17/07/19.
//  Copyright © 2019 Rahul Kashyap. All rights reserved.
//

import XCTest
@testable import CVMaker


class UtilityTests: XCTestCase {
    
    var validNumber : NSString?
    var invalidNumber : NSString?

    override func setUp() {
        super.setUp()
        validNumber = "1234567890"
        invalidNumber = "12345678901"
        
    }
    
    func testIsValidNumber(){
        let maxLength = 10
        XCTAssertTrue(validNumber!.length <= maxLength)
    }
    
    func testIsInValidNumber(){
        let maxLength = 10
        XCTAssertFalse(invalidNumber!.length <= maxLength)
    }

    override func tearDown() {
        super.tearDown()
        validNumber = nil
        invalidNumber = nil
    }
    
    func testFetDocumentDirectory(){
       let url = Utility.sharedInstance.getDocumentsDirectory()
        XCTAssertNotNil(url)
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
