//
//  NetworkManager+Table.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import Foundation

import Foundation
extension NetworkManager {
    
    func fetchRummyTableData(success: @escaping ((TableResult) -> Void),
                               failure: @escaping ((Error) -> Void)) {
        let request = FetchRummyTableRequest()
        let parseBlock: ParseBlock = { (jsonData: Data) -> Any? in

            let decoder = JSONDecoder()
            do {
                return try decoder.decode(TableResult.self, from: jsonData)
            }
            catch {
                print(error.localizedDescription)
                return error
            }
        }
        
        execute(request: request, parseBlock: parseBlock, success: { (result) in
            if let resultValue = result as? TableResult {
                success(resultValue)
            } else {
                print("parse error")
                failure(ErrorManager.error(code: 1001, errorDescription: Constants.ErrorKeys.dataParsingError))
            }
        }, failure: failure)
    }
}
