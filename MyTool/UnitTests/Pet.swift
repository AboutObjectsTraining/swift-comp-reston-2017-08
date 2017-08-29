//
//  Pet.swift
//  MyTool
//
//  Created by Jonathan Lehr on 8/28/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import Foundation

struct Pet {
    var identifier: Int
    var name: String
    
    init(identifier: Int = 0, name: String = "Unknown") {
        self.identifier = identifier
        self.name = name
    }
}

extension Pet: CustomStringConvertible {
    var description: String {
        return "Pet name: \(name), identifier: \(identifier)"
    }
    
    var foo: String {
//        1 < 2
        get { return "Foo" }
        set { print("Foo") }
    }
}
