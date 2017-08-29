//
//  UnitTests.swift
//  UnitTests
//
//  Created by Jonathan Lehr on 8/28/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import XCTest

class UnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        print()
    }
    
    override func tearDown() {
        print()
        super.tearDown()
    }
    
    func testLocalVariables() {
//        var otherNumber: Int
//        var number = 1
//        
//        var word = "Hey!"
        var word2: String
        word2 = "Bar"
        word2.append(" Foo")
        print(word2)
        
        let myString = String(format: "length %d", word2.characters.count)
        print(myString)
    }
    
    func testLocalConstantsA() {
        let word = "Yay!"
        print(word)
        
        print("My word is \(word.lowercased())")
        print("hello world!".capitalized)
    }
    
    func testNumericConversions() {
        let x = 2
        let y = 3.5 * Double(x)
        print(y)
    }
    
    func testWorkWithStructs() {
        
        let myPet = Pet(identifier: 101, name: "Fluffy")
        print(myPet)
        
        let pet2 = Pet(identifier: 102)
        print(pet2)
        
        let pet3 = Pet(name: "Fifi")
        print(pet3)
        
        let pet4 = Pet()
        print(pet4)
    }
}













