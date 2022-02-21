//
//  IngredientAndMeasureTableViewCell.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 21/02/2022.
//

import UIKit

class IngredientAndMeasureTableViewCell: UITableViewCell {

    static let cellHeight: CGFloat = 60
    
    @IBOutlet private weak var ingredientView: UIView!
    @IBOutlet private weak var measureView: UIView!
    @IBOutlet private weak var ingredientLabel: UILabel!
    @IBOutlet private weak var measureLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        ingredientView.setBgColor(bgColor: .cocktailerTertiary, alpha: 1)
        measureView.setBgColor(bgColor: .cocktailerLightColor, alpha: 1)
        ingredientLabel.set(
            font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            color: .cocktailerLightColor,
            align: .center)
        measureLabel.set(
            font: UIFont.systemFont(ofSize: 20, weight: .regular),
            color: .cocktailerDarkColor,
            align: .center)
        ingredientLabel.numberOfLines = 0
        measureLabel.numberOfLines = 0
    }
    
    func configure(withIngredient ingredient: String, andMeasure measure: String) {
        ingredientLabel.text = ingredient
        measureLabel.text = measure
    }
}
