//
//  DashboardViewModel.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import Foundation
import Foundation

protocol DashboardViewModelProtocol: class {
    func didFetchRummyTableSuccessfully()
    func didFailFetchingRummyTable(error: Error)
}

class DashboardViewModel {
    
    private var rummyTableList = TableResult()
    weak var delegate: DashboardViewModelProtocol?
    
    init() {}
    
    func getRummyTableData() -> TableResult {
        return rummyTableList
    }
    
    func fetchRummyTableData() {
        NetworkManager.shared.fetchRummyTableData(success: { [weak self] (tableResult) in
            self?.rummyTableList = tableResult
            self?.delegate?.didFetchRummyTableSuccessfully()
        }) { [weak self] (error) in
            self?.delegate?.didFailFetchingRummyTable(error: error)
        }
    }
}
