//
//  ShadowView.swift
//  HackathonVisa
//
//  Created by Jean Paul Marinho on 15/02/19.
//  Copyright © 2019 aKANJ. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.roundCorners(radius: 12)
        layer.addShadow()
    }

}
