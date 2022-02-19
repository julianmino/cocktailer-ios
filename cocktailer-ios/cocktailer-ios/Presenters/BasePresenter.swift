//
//  BasePresenter.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation

protocol BasePresenterDelegate: AnyObject {
    func showLoadingView()
    func hideLoadingView()
    func onError(_ message: String)
}

class BasePresenter<T: BasePresenterDelegate> {
    
    internal weak var delegate: T?
    
    func attach(_ view: T) {
        delegate = view
    }
}
