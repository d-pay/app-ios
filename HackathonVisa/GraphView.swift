//
//  GraphView.swift
//  HackathonVisa
//
//  Created by Jean Paul Marinho on 14/02/19.
//  Copyright © 2019 aKANJ. All rights reserved.
//

import UIKit
import ScrollableGraphView

class GraphView: ScrollableGraphView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource = self
        let blueLinePlot = LinePlot(identifier: "multiBlue")
        blueLinePlot.lineWidth = 1
        blueLinePlot.lineColor = UIColor(hexString: "#16aafc")
        blueLinePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        blueLinePlot.shouldFill = true
        blueLinePlot.fillType = ScrollableGraphViewFillType.solid
        blueLinePlot.fillColor = UIColor(hexString: "#16aafc").withAlphaComponent(0.5)
        blueLinePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        // Setup the second line plot.
        let orangeLinePlot = LinePlot(identifier: "multiOrange")
        orangeLinePlot.lineWidth = 1
        orangeLinePlot.lineColor = UIColor(hexString: "#ff7d78")
        orangeLinePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        orangeLinePlot.shouldFill = true
        orangeLinePlot.fillType = ScrollableGraphViewFillType.solid
        orangeLinePlot.fillColor = UIColor(hexString: "#ff7d78").withAlphaComponent(0.5)
        orangeLinePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        // Setup the reference lines.
        let referenceLines = ReferenceLines()
        referenceLines.referenceLineLabelFont = UIFont.boldSystemFont(ofSize: 8)
        referenceLines.referenceLineColor = UIColor.clear
        referenceLines.referenceLineLabelColor = UIColor.black
        referenceLines.dataPointLabelColor = UIColor.black.withAlphaComponent(1)
        // Setup the graph
        backgroundFillColor = UIColor.clear
        dataPointSpacing = 80
        shouldAnimateOnStartup = true
        shouldAdaptRange = true
        shouldRangeAlwaysStartAtZero = true
        // Add everything to the graph.
        addReferenceLines(referenceLines: referenceLines)
        addPlot(plot: blueLinePlot)
        addPlot(plot: orangeLinePlot)
    }
}



extension GraphView: ScrollableGraphViewDataSource {
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        return Double.random(in: 0...4)
    }

    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex+1)"
    }

    func numberOfPoints() -> Int {
        return 29
    }
}
