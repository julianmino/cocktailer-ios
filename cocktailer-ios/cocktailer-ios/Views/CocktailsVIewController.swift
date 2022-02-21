//
//  ViewController.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 18/02/2022.
//

import UIKit

class CocktailsViewController: BaseViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!
    
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
