//
//  DashboardViewController.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 27/06/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    private let dashboardViewModel = DashboardViewModel()

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    struct DashboardConstants {
        static let collectionCellPadding: CGFloat = 0
        static let collectionCellHeight: CGFloat = 218
        static let collectionCellWidth: CGFloat = 189

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dashboardViewModel.delegate = self
        dashboardViewModel.fetchRummyTableData()
        setHeaderImages()
        // Do any additional setup after loading the view.
    }
    
    func setHeaderImages(){
        self.img1.layer.cornerRadius = 22
        self.img2.layer.cornerRadius = 22
        self.img2.layer.masksToBounds = true
        self.img1.layer.masksToBounds = true
        self.img3.layer.cornerRadius = 22
        self.img4.layer.cornerRadius = 22
        self.img3.layer.masksToBounds = true
        self.img4.layer.masksToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DashboardViewController: DashboardViewModelProtocol {
    func didFetchRummyTableSuccessfully() {
        DispatchQueue.main.async { [self] in
           print(dashboardViewModel.getRummyTableData().count)
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.reloadData()
        }
    }
    
    func didFailFetchingRummyTable(error: Error) {
        print(error)
    }
}

extension DashboardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dashboardViewModel.getRummyTableData().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DashboardTableCollectionViewCell.reuseIdentifier, for: indexPath) as? DashboardTableCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let data = dashboardViewModel.getRummyTableData()[indexPath.item]
        cell.setInfo(title:data.tableName, bet:String(data.betValue))
        return cell
    }
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
       // let width = (collectionView.frame.size.width - DashboardConstants.collectionCellPadding)/2
        return CGSize(width: DashboardConstants.collectionCellWidth, height: DashboardConstants.collectionCellHeight)
    }
}

extension DashboardViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

