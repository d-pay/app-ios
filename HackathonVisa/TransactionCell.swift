//
//  TransactionCell.swift
//  HackathonVisa
//
//  Created by Jean Paul Marinho on 14/02/19.
//  Copyright © 2019 aKANJ. All rights reserved.
//

import UIKit

class TransactionCell: UITableViewCell {

    @IBOutlet var brandImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var createdLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var daysLeftLabel: UILabel!
    @IBOutlet var progressBarView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setProgress(value: Double) {
        progressBarView.frame = CGRect(x: progressBarView.frame.origin.x, y: progressBarView.frame.origin.y, width: CGFloat(37.4 * value), height: progressBarView.frame.height)
    }
}
