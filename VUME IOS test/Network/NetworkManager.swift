//
//  NetworkManager.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import Foundation

import Alamofire

/// A custom parse block
public typealias ParseBlock = (Data) -> Any?

/// NetworkManager class for handling all Network related tasks
public class NetworkManager {
    
    /// Shared instance of Network Manager
    static public let shared = NetworkManager()
    
    // MARK: - Constants
    private(set) var baseUrl: String
    private(set) var imageBaseUrl: String
    private(set) var apiKey: String
    
    // MARK: - Initializer
    private init() {
        

        self.imageBaseUrl = ""
        self.baseUrl = "https://f3-api.jaqk.in/api/rummy/"
        self.apiKey = ""
    }
    
    // MARK: - User-defined Functions
    /// Generic Function to execute Network request.
    ///
    /// - Parameters:
    ///   - request: NetworkRequestConvertible request which is to be executed
    ///   - parseBlock: Block to specify to parse destination response object
    ///   - success: If executeRequest() function returns success then response object will be returned back in success block
    ///   - failure: If executeRequest() function returns failure then Error will be returned back in failure block
    public func execute(request: NetworkRequestConvertible,
                        parseBlock: @escaping (ParseBlock),
                        success: @escaping((Any) -> Void),
                        failure: @escaping ((Error) -> Void)) {
        
        NetworkRequest.execute(request: request, success: {(response) in
            if let parseResponse = response as? Data, let parsedResponse = parseBlock(parseResponse) {
                success(parsedResponse)
            } else {
                success(response)
            }
        }, failure: {(error) in
            failure(error)
        })
    }
}
