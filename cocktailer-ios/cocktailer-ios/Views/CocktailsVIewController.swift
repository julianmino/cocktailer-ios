//
//  ViewController.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 18/02/2022.
//

import UIKit

class CocktailsViewController: BaseViewController {

    private var presenter = CocktailsPresenter<CocktailsViewController>()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension CocktailsViewController: CocktailsPresenterDelegate {
    
    func showLoadingView() {
        startLoading()
    }
    
    func hideLoadingView() {
        stopLoading()
    }
    
    func onError(_ message: String) {
        AlertHelper.showErrorAlert(message: message)
    }
    
    func getCocktails() {
    }
}
