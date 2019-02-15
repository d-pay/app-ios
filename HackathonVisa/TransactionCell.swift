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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
