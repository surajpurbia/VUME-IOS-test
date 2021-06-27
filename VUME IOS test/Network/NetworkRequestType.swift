//
//  NetworkRequestType.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import Foundation
public enum NetworkRequestType {
   case rummyTable
    public var urlPath: String {
        switch self {
        case .rummyTable:
            return "tables"
        }
    }
}
