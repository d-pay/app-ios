//
//  CALayer+ShadowCorner.swift
//  HackathonVisa
//
//  Created by Jean Paul Marinho on 15/02/19.
//  Copyright © 2019 aKANJ. All rights reserved.
//

import UIKit

extension CALayer {
    
    func addShadow(with offset: CGSize = .zero) {
        shadowOffset = offset
        shadowOpacity = 0.3
        shadowRadius = 5
        shadowColor = UIColor.black.cgColor
        masksToBounds = false
        if cornerRadius != 0 {
            addShadowWithRoundedCorners()
        }
    }
    
    func roundCorners(radius: CGFloat) {
        cornerRadius = radius
        if shadowOpacity != 0 {
            addShadowWithRoundedCorners()
        }
    }
    
    private func addShadowWithRoundedCorners() {
        if let contents = self.contents {
            masksToBounds = false
            sublayers?.filter{ $0.frame.equalTo(self.bounds) }
                .forEach{ $0.roundCorners(radius: self.cornerRadius) }
            self.contents = nil
            if let sublayer = sublayers?.first,
                sublayer.name == "overlayLayerView" {
                
                sublayer.removeFromSuperlayer()
            }
            let contentLayer = CALayer()
            contentLayer.name = "overlayLayerView"
            contentLayer.contents = contents
            contentLayer.frame = bounds
            contentLayer.cornerRadius = cornerRadius
            contentLayer.masksToBounds = true
            insertSublayer(contentLayer, at: 0)
        }
    }
}
