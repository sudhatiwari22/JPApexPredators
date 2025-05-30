//
//  ApexPredator.swift
//  JPApexPredators
//
//  Created by Sudha Rani on 30/05/25.
//

struct ApexPredator: Decodable {
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScenes]
    let link: String
    
    struct MovieScenes: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}
