//
//  LaCroixTests.swift
//  LaCroixTestBundle
//
//  Created by Cara  Brennan on 1/7/19.
//  Copyright © 2019 Cara  Brennan. All rights reserved.
//

import XCTest
@testable import iOSUnitTestsIntro

class LaCroixTests: XCTestCase {

    override func setUp() {
        super.setUp()
        var testData = ["Banana Cabana 1",
            "Grape Escape 2",
            "Star Fruit Salute 3",
            "Guava Java 4",
            "Blackberry Fairy 5",
            "Guava Java 1",
            "Grape Escape 2",
            "Star Fruit Salute 3",
            "Blackberry Fairy 4",
            "Banana Cabana 5",
            "Banana Cabana 1",
            "Star Fruit Salute 2",
            "Grape Escape 3",
            "Guava Java 4",
            "Blackberry Fairy 5"]
        
        var laCroixBoard:[String: Int] =
            ["Banana Cabana": 0,
             "Grape Escape": 0,
             "Star Fruit Salute": 0,
             "Guava Java": 0,
             "Blackberry Fairy": 0]

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        testData = nil
        laCroixBoard = nil
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
    
    func testHighestPoints(){
        for data in testData {
            addEntry(data)
        }
        
       "Guava Java 4" = ratedEntries(laCroixBoard: laCroixBoard)[0]
    }

}

//flavor: Banana Cabana: points: 10
//flavor: Grape Escape: points: 8
//flavor: Guava Java: points: 7
//flavor: Star Fruit Salute: points: 7
//flavor: Blackberry Fairy: points: 1
