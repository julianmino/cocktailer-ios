//
//  CocktailerViewController.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 18/02/2022.
//

import UIKit

class CocktailerViewController: BaseViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var searchButton: UIButton!
    
    private var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    private func setSearchText(_ newValue: String?) {
        searchText = newValue ?? ""
    }
    
    @IBAction func onSearchTapped(_ sender: UIButton) {
        performSegue(withIdentifier: R.segue.cocktailerViewController.cocktailsListSegue.identifier, sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cocktailsVC = segue.destination as? CocktailsViewController {
            cocktailsVC.setSearchText(searchText)
        }
    }
}

extension CocktailerViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setSearchText(textField.text)
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        setSearchText(textField.text)
        return true
    }
}
