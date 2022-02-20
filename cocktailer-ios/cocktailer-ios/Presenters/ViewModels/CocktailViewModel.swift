//
//  CocktailsViewModel.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation

struct CocktailViewModel: BaseViewModel {
    
    typealias T = CocktailRealModel

    var name: String
    var imageURL: String
    var ingredientsArray: [String]
    var measuresArray: [String]
    var instructions: String
    
    init(model: T) {
        name = model.name
        imageURL = model.imageURL
        ingredientsArray = CocktailViewModel.array(from: model, ofAttributes: "ingredient")
        measuresArray = CocktailViewModel.array(from: model, ofAttributes: "measure")
        instructions = model.instructions
    }
}
