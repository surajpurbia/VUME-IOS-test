//
//  Constants.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import Foundation

public struct Constants {
    /// Constants for Network
    struct NetworkKeys {
        /// networkTimeout defines the timeout network requests creations in seconds
        static let networkTimeout: Double = 30
        static let networkSessionIdentifier = "network.alamofireBackgroundSessionIdentifier"
        static let apiKey = ""
    }
    
    /// Constants for Error
    struct ErrorKeys {
        static let errorDomain = "error.vume.iOS"
        static let dataParsingError = "error.dataParsing"
        static let badResponse = "error.badResponse"
    }
}
