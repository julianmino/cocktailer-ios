//
//  PathBuilder.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation

class QueryParamsBuilder {
    
    private enum QueryParams {
        case search(String)
        
        var value: String {
            switch self {
            case let .search(cocktailName):
                return "s=\(cocktailName)"
            }
        }
    }
    
    private enum Endpoints {
        case search
        
        var value: String {
            switch self {
            case .search:
                return "/search.php"
            }
        }
    }
    
    static func searchqueryParams(forCocktail cocktailName: String) -> String {
        return "\(Endpoints.search.value)?\(QueryParams.search(cocktailName).value)"
    }
}

class PathBuilder {
    
    private static var baseURL: String {
        return "https://www.thecocktaildb.com/api/json"
    }
    
    private static var apiVersion: String {
        return "/v1"
    }
    
    private static var apiKey: String {
        return "/1"
    }
    
    private static var apiURL: String {
        return "\(PathBuilder.baseURL)\(PathBuilder.apiVersion)\(PathBuilder.apiKey)"
    }
    
    static func getCocktailsByName(_ name: String) -> String {
        return "\(PathBuilder.apiURL)\(QueryParamsBuilder.searchqueryParams(forCocktail: name))"
    }
}
