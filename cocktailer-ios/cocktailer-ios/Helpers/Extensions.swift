//
//  Extensions.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 20/02/2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIColor {
    
    private static var cocktailerPrimary: UIColor {
        return UIColor(red: 225/255, green: 73/255, blue: 0, alpha: 1)
    }
    
    private static var cocktailerSecondary: UIColor {
        return UIColor(red: 133/255, green: 146/255, blue: 166/255, alpha: 1)
    }
    
    private static var cocktailerTertiary: UIColor {
        return UIColor(red: 186/255, green: 60/255, blue: 81/255, alpha: 1)
    }
    
    private static var cocktailerLightColor: UIColor {
        return UIColor(red: 243/255, green: 248/255, blue: 243/255, alpha: 1)
    }
    
    private static var cocktailerDarkColor: UIColor {
        return UIColor(red: 31/255, green: 20/255, blue: 31/255, alpha: 1)
    }
}


extension UIView {
    func setBgColor(bgColor: UIColor, alpha: CGFloat) {
        self.backgroundColor = bgColor
        self.alpha = alpha
    }
    
    func roundBorders(_ value: CGFloat = 10) {
        self.layer.cornerRadius = value
    }
    
    func circle() {
        self.layer.cornerRadius = self.frame.size.height / 2
    }
    
    func setBorder(width: CGFloat, color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

extension UIImageView {
    func setImage(fromUrl urlString: String) {
        let url = URL(string: urlString)
        self.kf.setImage(with: url)
    }
}

extension UIButton {
    func set(title: String?, image: UIImage?, color: UIColor) {
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.tintColor = color
    }
}
