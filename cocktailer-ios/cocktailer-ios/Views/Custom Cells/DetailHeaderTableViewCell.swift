//
//  DetailHeaderTableViewCell.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 21/02/2022.
//

import UIKit

class DetailHeaderTableViewCell: UITableViewHeaderFooterView {

    static let cellHeight: CGFloat = 80

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        titleLabel.set(
            font: UIFont.systemFont(ofSize: 26, weight: .bold),
            color: .cocktailerDarkColor,
            align: .center)
        setBgColor(bgColor: .cocktailerSecondary, alpha: 1)
        titleLabel.numberOfLines = 0
    }
    
    func configure(withTitle title: String) {
        titleLabel.text = title
    }
}
