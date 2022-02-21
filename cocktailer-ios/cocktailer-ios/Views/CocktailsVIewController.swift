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
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setup() {
        view.backgroundColor = .cocktailerLightColor
        titleLabel.set(
            font: UIFont.systemFont(ofSize: 30, weight: .bold),
            color: .cocktailerPrimary,
            align: .center)
        descriptionLabel.set(
            font: UIFont.systemFont(ofSize: 18, weight: .semibold),
            color: .cocktailerDarkColor,
            align: .center)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.adjustsFontSizeToFitWidth = true
        
        titleLabel.text = R.string.localizable.cocktailer()
        imageView.image = R.image.cocktailerIcon()
        descriptionLabel.text = R.string.localizable.searchForADrinkMessage()
        
        searchButton.layoutIfNeeded()
        searchTextField.returnKeyType = .done
        searchTextField.delegate = self
        searchButton.roundBorders(searchButton.frame.height / 2)
        searchButton.set(
            title: R.string.localizable.search(),
            image: nil,
            tintColor: .cocktailerLightColor,
            bgColor: .cocktailerPrimary)
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
