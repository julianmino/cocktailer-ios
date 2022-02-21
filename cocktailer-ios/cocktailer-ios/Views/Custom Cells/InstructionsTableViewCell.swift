//
//  InstructionsTableViewCell.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 21/02/2022.
//

import UIKit

class InstructionsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var instructionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        selectionStyle = .none
        instructionsLabel.set(
            font: UIFont.systemFont(ofSize: 18, weight: .regular),
            color: .cocktailerDarkColor,
            align: .justified)
        instructionsLabel.numberOfLines = 0
    }
    
    func configure(withInstructions instructions: String) {
        instructionsLabel.text = instructions
    }}
