//
//  ConsoleIO.swift
//  LaCroixTasteTest
//
//  Created by Cara  Brennan on 1/6/19.
//  Copyright © 2019 Cara  Brennan. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            // 1
            print("\u{001B}[;m\(message)")
        case .error:
            // 2
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
    
    func getInput() -> String {
        // 1
        let keyboard = FileHandle.standardInput
        // 2
        let inputData = keyboard.availableData
        // 3
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        // 4
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
    
    
    func printUsage() {
        
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        writeMessage("usage:")
        writeMessage("\(executableName) -f url")
        writeMessage("or")
        writeMessage("\(executableName) -r no input")
        writeMessage("or")
        writeMessage("\(executableName) -h to show usage information")
        writeMessage("Type \(executableName) without an option to enter interactive mode.")
    }

}
