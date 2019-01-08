//
//  RatingLaCroix.swift
//  LaCroixTasteTest
//
//  Created by Cara  Brennan on 1/6/19.
//  Copyright © 2019 Cara  Brennan. All rights reserved.
//

import Foundation

enum OptionType: String {
    case file = "f"
    case rate = "r"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "f": self = .file
        case "r": self = .rate
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

class RatingLaCroix {
    let consoleIO = ConsoleIO()
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to the LaCroix Rating Program. This program takes ratings for new LaCroix flavors and determines which and returns the a sorted list with highest rating first.")
        let shouldQuit = false
        while !shouldQuit {
            //3
            consoleIO.writeMessage("Type 'f' to add input file or 'r' to rate entries, type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .file:
                consoleIO.writeMessage("Type URL of file")
                let fileURL = consoleIO.getInput()
                accessFile(path: fileURL)
                
            case .rate:
                _ = ratedEntries(laCroixBoard: laCroixBoard)
               
            case .unknown, .quit:
                
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
    
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    var laCroixBoard:[String: Int] =
        ["Banana Cabana": 0,
         "Grape Escape": 0,
         "Star Fruit Salute": 0,
         "Guava Java": 0,
         "Blackberry Fairy": 0]
    
    
    func accessFile(path: String){
        do {
            let u = URL(fileURLWithPath: path)
            try processFile(at: u)
        } catch {
            print("error processing: \(path): \(error)")
        }
        
    }

    func processFile(at url: URL) throws {
        let s = try String(contentsOf: url)
        try process(string: s)
    }
    
    func process(string: String) throws {
        let myStrings = string.components(separatedBy: .newlines)
        
        for entry in myStrings {
            _ = addEntry(entry: entry)
        }
    }
    
    func addEntry(entry: String) {
        var rank = [0 , 5, 3, 2, 1, 0]
        var points = 0
        var name = ""
        
        points =  rank[Int(String(entry.suffix(1)))!]
        
        let indexEndOfText = entry.index(entry.endIndex, offsetBy: -2)
        name = String(entry[..<indexEndOfText])
        
        let currentPoints = laCroixBoard[name, default: 0]
        laCroixBoard[name] = currentPoints + points
    }
    
    func ratedEntries(laCroixBoard: [String: Int]) -> [String] {
        var ratedArray:[String] = []
        var n:Int = 1
        for (k, v) in (Array(laCroixBoard).sorted {
            if $0.1 != $1.1 {
                return $0.1 > $1.1
            } else {
                return $0.0.count < $1.0.count
            }
        }) {
            ratedArray.append("\(n). \(k), \(v) pts")
            print("\(n). \(k), \(v) pts")
             n += 1
        }
        return ratedArray
    }
    
    func ratedEntries() -> [String] {
        return ratedEntries(laCroixBoard:self.laCroixBoard)
}

}





