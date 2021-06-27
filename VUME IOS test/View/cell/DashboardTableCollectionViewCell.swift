//
//  DashboardTableCollectionViewCell.swift
//  VUME IOS test
//
//  Created by Suraj Purbia on 28/06/21.
//

import UIKit

class DashboardTableCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "DashboardTableCollectionViewCell"

    @IBOutlet weak var lbl_tableName: UILabel!
    @IBOutlet weak var lbl_playerMinValue: UILabel!
    @IBOutlet weak var lbl_playerMaxValue: UILabel!
    @IBOutlet weak var btn_minus: UIButton!
    @IBOutlet weak var btn_pluse: UIButton!
    @IBOutlet weak var lbl_betValue: UILabel!
    @IBOutlet weak var btn_join: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lbl_betValue.layer.cornerRadius = 5
        self.lbl_betValue.layer.masksToBounds = true

        
    }
    @IBAction func joinNow_Action(_ sender: Any) {
    }
    @IBAction func pluse_Action(_ sender: Any) {
    }
    @IBAction func minus_Action(_ sender: Any) {
    }
    
    func setInfo(title: String, bet: String?) {
        self.lbl_tableName.text = title
        self.lbl_betValue.text = bet
    }
}
