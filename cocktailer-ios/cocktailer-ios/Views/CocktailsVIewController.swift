//
//  CocktailsViewController.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 21/02/2022.
//

import UIKit

class CocktailsViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var presenter = CocktailsPresenter<CocktailsViewController>()

    private var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attach(self)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getDrinks(for: searchText)
    }
    
    private func setup() {
        registerNibs()
        setTableView()
        navigationController?.title = "Results for '\(searchText)'"
    }
    
    private func registerNibs() {
        tableView.register(
            UINib(nibName: R.nib.cocktailTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.cocktailTableViewCell.identifier)
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setSearchText(_ newValue: String) {
        searchText = newValue
    }
}

extension CocktailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.datasource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CocktailTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.cocktailTableViewCell.identifier, for: indexPath) as? CocktailTableViewCell {
            let item = presenter.datasource[indexPath.row]
            cell.configure(with: item)
            return cell
        }
        return UITableViewCell()
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
        tableView.reloadData()
    }
}
