//
//  BaseViewController.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func startLoading() {
        SVProgressHUD.show()
    }

    func stopLoading() {
        SVProgressHUD.dismiss()
    }
}
