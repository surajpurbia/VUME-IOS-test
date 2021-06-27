//
//  AppSession.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//


import Alamofire

/// Session for all `URLRequest` in the application.
let AppSession: SessionManager = {
    
    // Background session
    let configuration = URLSessionConfiguration.background(withIdentifier: Constants.NetworkKeys.networkSessionIdentifier)
    
    // Turn-off caching
    configuration.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
    configuration.urlCache = nil
    
    // Request Time-out
    configuration.timeoutIntervalForRequest = Constants.NetworkKeys.networkTimeout
    
    // Set service type
    configuration.isDiscretionary = false
    configuration.networkServiceType = .responsiveData
    
    // Create session
    let session = Alamofire.SessionManager(configuration: configuration)
    return session
}()
