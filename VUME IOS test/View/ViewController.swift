//
//  ViewController.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import UIKit

class ViewController: UIViewController {
    private let dashboardViewModel = DashboardViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dashboardViewModel.delegate = self
        dashboardViewModel.fetchRummyTableData()

    }
}

extension ViewController: DashboardViewModelProtocol {
    func didFetchRummyTableSuccessfully() {
        DispatchQueue.main.async { [self] in
           print(dashboardViewModel.getRummyTableData().count)
        }
    }
    
    func didFailFetchingRummyTable(error: Error) {
        print(error)
    }
    
}

