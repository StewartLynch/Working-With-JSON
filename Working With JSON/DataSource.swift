//
//  DataSource.swift
//  Working With JSON
//
//  Created by Stewart Lynch on 9/21/19.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import Foundation


enum DataSource {
    
    static func loadSeedData() -> [User] {
        guard let url = Bundle.main.url(forResource: "SeedData", withExtension: "json") else {
            fatalError("Could not find SeedData.json")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load SeedDatal.json from bundle")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode([User].self, from: data) else {
            fatalError("Failed to decode SeedData.json from bundle")
        }
        return loaded
    }
    
    static func createNewJSON(from data: [User]) -> String {
        let encoder = JSONEncoder()
        guard let newJSON = try? encoder.encode(data) else {
            fatalError("Could not encode data")
        }
        return String(data: newJSON, encoding: .utf8)!
    }
}
