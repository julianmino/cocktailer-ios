//
//  BaseManager.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation
import Alamofire

protocol BaseManagerDelegate: AnyObject {
    func onStartService()
    func onFinishService()
    func onError(_ error: ServiceBaseError)
}

class BaseManager {
}
