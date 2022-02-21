//
//  BaseViewModel.swift
//  cocktailer-ios
//
//  Created by Julian Miño on 19/02/2022.
//

import Foundation

protocol BaseViewModel {
    associatedtype T: AnyObject
    init(model: T)
    static func array(of objects: [T]) -> [Self]
    static func array(from object: T, ofAttributes attrString: String) -> [String]
}

extension BaseViewModel {
    
    static func array(of objects: [T]) -> [Self] {
        return objects.map { return Self(model: $0) }
    }
    
    static func array(from object: T, ofAttributes attrString: String) -> [String] {
        var attributesArray: [String] = []
        let mirror = Mirror(reflecting: object)
        for child in mirror.children {
            if let attributeName = child.label,
               let attributeValue = child.value as? String {
                if attributeName.contains(attrString) {
                    attributesArray.append(attributeValue)
                }
            }
        }
        return attributesArray
    }
}
