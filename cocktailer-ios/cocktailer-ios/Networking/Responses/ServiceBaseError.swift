//
//  ResponseBaseError.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation

class ServiceBaseError: NSObject, Codable {
    var errorcode: String = ""
    var error: String = ""
    var message: String = ""
    
    init(error: Error?) {
        guard let error = error else {return}
        if let errorcode = (error.asAFError?.responseCode) {
            self.errorcode = String(errorcode)
            self.message = error.localizedDescription
            self.error = error.asAFError?.errorDescription ?? ""
        }
    }
}
