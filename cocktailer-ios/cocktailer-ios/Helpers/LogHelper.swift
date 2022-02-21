//
//  BaseResponse.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 21/02/2022.
//

import Foundation

enum ServiceName {
    case fetchDrinks
    
    var value: String {
        switch self {
        case .fetchDrinks:
            return "fetchDrinks"
        }
    }
}
open class LOG: NSObject {
    open class func SUCCESS(_ service: String) {
        NSLog("[<<<SERVICE>>>][SUCCESS] -> %@", service)
    }
    
    open class func ERROR(_ service: String, errorMessage: String) {
        NSLog("[<<<SERVICE>>>][ERROR] -> %@ >> Error: %@", service, errorMessage)
    }
}
