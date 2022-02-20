//
//  CocktailsPresenter.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation

protocol CocktailsPresenterDelegate: BasePresenterDelegate {
    func getCocktails()
}

class CocktailsPresenter<T: CocktailsPresenterDelegate>: BasePresenter<T> {
    
    private var _datasource: [CocktailViewModel] = []
    var datasource: [CocktailViewModel] {
        return _datasource
    }
    
    func getDrinks(for searchString: String) {
        CocktailsManager.sharedInstance.fetchDrinks(delegate: self, searchText: searchString)
    }
}

extension CocktailsPresenter: CocktailManagerDelegate {
    
    func onStartService() {
        delegate?.showLoadingView()
    }
    
    func onFinishService() {
        delegate?.hideLoadingView()
    }
    
    func onError(_ error: ServiceBaseError) {
        delegate?.onError(error.message)
    }
    
    func onFetchDrinks(_ drinks: [CocktailRealModel]) {
        _datasource = CocktailViewModel.array(of: drinks)
        delegate?.getCocktails()
    }
}
