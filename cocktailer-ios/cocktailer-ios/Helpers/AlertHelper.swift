//
//  AlertHelper.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 18/02/2022.
//

import Foundation
import UIKit

class AlertHelper {
    
    static func showErrorAlert(message: String) {
        let alertView = UIAlertController(title: R.string.localizable.error(), message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: R.string.localizable.ok(), style: .default, handler: nil))
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {return}
        if let presentedVC = rootVC.presentedViewController {
            DispatchQueue.main.async {
                presentedVC.present(alertView, animated: true, completion: nil)
            }
        }
        rootVC.present(alertView, animated: true, completion: nil)
    }
}
