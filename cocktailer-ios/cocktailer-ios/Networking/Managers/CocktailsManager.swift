//
//  CocktailsManager.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation
import Alamofire

protocol CocktailManagerDelegate: BaseManagerDelegate {
    func onFetchDrinks(_ drinks: [CocktailRealModel])
}

class CocktailsManager: BaseManager {
    
    class var sharedInstance: CocktailsManager {
        struct Static {
            static let instance = CocktailsManager()
        }
        return Static.instance
    }
    
    func fetchDrinks(delegate: CocktailManagerDelegate, searchText: String) {
        delegate.onStartService()
        let url = PathBuilder.getCocktailsByName(searchText)
        AF.request(url).validate().responseDecodable(of: DrinksRealModel.self, completionHandler: { (response) in
            switch response.result {
            case let .failure(error):
                guard let data = response.data, let serviceError = try? JSONDecoder().decode(ServiceBaseError.self, from: data) else {
                    delegate.onError(ServiceBaseError(error: error))
                    return
                }
                delegate.onError(serviceError)
            case let .success(safeResponse):
                delegate.onFetchDrinks(safeResponse.drinks)
            }
            delegate.onFinishService()
        })
    }
}
