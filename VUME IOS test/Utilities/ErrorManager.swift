//
//  ErrorManager.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//


import Foundation

final class ErrorManager {
    
    static func error(domain: String? = nil, code: Int, errorDescription: String) -> Error {
        let userInfo = [NSLocalizedDescriptionKey: errorDescription]
        return NSError(domain: domain ?? Constants.ErrorKeys.errorDomain, code: code, userInfo: userInfo)
    }
}
