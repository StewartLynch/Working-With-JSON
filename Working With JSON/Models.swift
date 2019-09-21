//
//  Models.swift
//  Working With JSON
//
//  Created by Stewart Lynch on 9/21/19.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import Foundation

class User: Codable {
    
    let name:String
    let favouriteNumber: Int
    let isProgrammer: Bool
    let origin:Origin
    var family:[Family]
    
    internal init(name: String, favouriteNumber: Int, isProgrammer: Bool, origin: Origin, family: [Family]) {
        self.name = name
        self.favouriteNumber = favouriteNumber
        self.isProgrammer = isProgrammer
        self.origin = origin
        self.family = family
    }
}


struct Origin: Codable {
    let city:String
    let country:String
}

struct Family:Codable {
    let name:String
    let age: Int
}
