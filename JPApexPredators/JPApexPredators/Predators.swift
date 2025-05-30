//
//  Predators.swift
//  JPApexPredators
//
//  Created by Sudha Rani on 30/05/25.
//

import Foundation

class Predators {
    var apexPredators = [ApexPredator]()
    
    init() {
        decodeApexPredatorsData()
    }
    
    func decodeApexPredatorsData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                
            } catch {
                print("Error decoding json data \(error)")
            }
        }
            
            
    }
}
