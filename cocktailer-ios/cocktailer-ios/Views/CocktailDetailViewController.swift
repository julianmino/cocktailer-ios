//
//  CocktailDetailViewController.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 21/02/2022.
//

import UIKit

class CocktailDetailViewController: UIViewController {

    @IBOutlet private weak var headerSection: UIView!
    @IBOutlet private weak var bodySection: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    var cocktail: CocktailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        registerNibs()
        tableView.reloadData()
    }
    
    private func setup() {
        view.layoutIfNeeded()
        headerSection.setBgColor(bgColor: .cocktailerDarkColor, alpha: 1)
        bodySection.setBgColor(bgColor: .cocktailerSecondary, alpha: 1)
        tableView.setBgColor(bgColor: .cocktailerLightColor, alpha: 1)
        titleLabel.set(
            font: UIFont.systemFont(ofSize: 35, weight: .semibold),
            color: .cocktailerLightColor,
            align: .left)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .never

        imageView.roundBorders(20)
        tableView.roundBorders(20)
        tableView.separatorStyle = .none
    
        if let cocktail = cocktail {
            imageView.setImage(fromUrl: cocktail.imageURL)
            titleLabel.text = cocktail.name
        }
    }
    
    private func registerNibs() {
        tableView.register(
            UINib(nibName: R.nib.detailHeaderTableViewCell.name, bundle: nil),
            forHeaderFooterViewReuseIdentifier: R.reuseIdentifier.detailHeaderTableViewCell.identifier)
        tableView.register(
            UINib(nibName: R.nib.ingredientAndMeasureTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.ingredientAndMeasureTableViewCell.identifier)
        tableView.register(
            UINib(nibName: R.nib.instructionsTableViewCell.name, bundle: nil),
            forCellReuseIdentifier: R.reuseIdentifier.instructionsTableViewCell.identifier)
    }
}

extension CocktailDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return DetailHeaderTableViewCell.cellHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let cell = tableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.detailHeaderTableViewCell.identifier) as? DetailHeaderTableViewCell {
            let titlesArray = [
                R.string.localizable.ingredientsAndMeasures(),
                R.string.localizable.instructions()]
            cell.configure(withTitle: titlesArray[section])
            return cell
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cocktail = cocktail {
            if section == 0 {
                return cocktail.ingredientsArray.count
            } else {
                return 1
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return IngredientAndMeasureTableViewCell.cellHeight
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.ingredientAndMeasureTableViewCell.identifier, for: indexPath) as? IngredientAndMeasureTableViewCell, let cocktail = cocktail {
                let ingredient = cocktail.ingredientsArray[indexPath.row]
                let measure = cocktail.measuresArray[indexPath.row]
                cell.configure(withIngredient: ingredient, andMeasure: measure)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.instructionsTableViewCell.identifier, for: indexPath) as? InstructionsTableViewCell, let cocktail = cocktail {
                cell.configure(withInstructions: cocktail.instructions)
                return cell
            }
        }
        return UITableViewCell()
    }
}
