//
//  FetchTableRequest.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import Foundation
struct FetchRummyTableRequest: NetworkRequestConvertible {
    
    /// String instance
    let urlString: String
    
    /// Initializer for the request type with provided inputs
    ///
    /// - Parameters:
    ///   - baseURL: String - Base URL of the request
    init() {
        urlString = NetworkManager.shared.baseUrl + NetworkRequestType.rummyTable.urlPath
    }
}
