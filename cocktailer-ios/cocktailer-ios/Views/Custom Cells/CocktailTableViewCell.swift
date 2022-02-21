//
//  CocktailTableViewCell.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 21/02/2022.
//

import UIKit

class CocktailTableViewCell: UITableViewCell {

    static let cellHeight: CGFloat = 80

    @IBOutlet private weak var drinkImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var chevron: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        drinkImage.roundBorders(10)
        chevron.tintColor = .cocktailerPrimary
    }
    
    func configure(with model: CocktailViewModel) {
        drinkImage.setImage(fromUrl: model.imageURL)
        nameLabel.text = model.name
    }
}
