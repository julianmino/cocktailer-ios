//
//  CocktailsDataRealModel.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation

struct CocktailsResponse: Codable {
    let drinks: [CocktailRealModel]
    
    enum CodingKeys: String, CodingKey {
        case drinks
    }
}
