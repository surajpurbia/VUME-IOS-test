//
//  NetworkRequestConvertible.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import Foundation

import Alamofire

/// Delegate for specifying network request details for implementing class
public protocol NetworkRequestConvertible {
    
    // MARK: - Variables
    
    /// URL string to be appended to base URL
    var urlString: String { get }
    
    // MARK: - Protocol Functions
    
    /// Initializes the http method to apply to a `URLRequest`.
    ///
    /// - Returns: The adapted `HTTPMethod`.
    func httpMethod() -> HTTPMethod
    
    /// Function for specify additional parameters
    ///
    /// - Returns: Dictionary of parameters to apply to a `URLRequest`
    func parameters() -> Parameters?
    
    /// Function to specify parameter encoding (way in which parameters should be sent in the request)
    ///
    /// - Returns: Type used to define how a set of parameters are applied to a `URLRequest`.
    func parameterEncoding() -> ParameterEncoding
}

// MARK: - Protocol Default Implementation
public extension NetworkRequestConvertible {
    /// Default definition for Http function
    func httpMethod() -> HTTPMethod {
        return .get
    }
    
    /// Default definition for parameterEncoding() function
    func parameterEncoding() -> ParameterEncoding {
        return URLEncoding.queryString
    }

    /// Default definition for parameters() function
    func parameters() -> Parameters? {
        return nil
    }
}
