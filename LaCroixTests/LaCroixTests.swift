//
//  LaCroixTests.swift
//  LaCroixTests
//
//  Created by Cara  Brennan on 1/7/19.
//  Copyright © 2019 Cara  Brennan. All rights reserved.
//

import XCTest
@testable import LaCroixTasteTest


//Based on description of task, tests were kept at a minimum. Normally would have tested validity of input, and put in checks for running rating function before inputting data.
class LaCroixTests: XCTestCase {
    var ratingLaCroix: RatingLaCroix!
    var testData:[String]!
    var laCroixBoard:[String: Int]!
    
    override func setUp() {
        super.setUp()
        ratingLaCroix = RatingLaCroix()
        testData = ["Banana Cabana 1",
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
        
         laCroixBoard =
            ["Banana Cabana": 0,
             "Grape Escape": 0,
             "Star Fruit Salute": 0,
             "Guava Java": 0,
             "Blackberry Fairy": 0]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testHighestPoints() {
        for entry in testData {
        ratingLaCroix.addEntry(entry: entry)
        }
        
        var array = ratingLaCroix.ratedEntries()
        let highest = array[0]
        let knownFirst = "1. Banana Cabana, 10 pts"
        
        XCTAssertEqual(highest, knownFirst)

    }
    
    func testLowestPoints(){
        for entry in testData {
            ratingLaCroix.addEntry(entry: entry)
            print(entry)
        }
        
        var array = ratingLaCroix.ratedEntries()
        let lowest = array[array.count-1]
        let knownLast = "5. Blackberry Fairy, 1 pts"
        
        XCTAssertEqual(lowest, knownLast)
    }
    
}




