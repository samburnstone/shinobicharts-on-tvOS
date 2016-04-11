//
//  Chart+Styling.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 01/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

import Foundation

extension ShinobiChart
{
    func applyStyle()
    {
        canvasAreaBackgroundColor = .clearColor()
        plotAreaBackgroundColor = .clearColor()
        backgroundColor = .clearColor()
    }
}

extension SChartAxis
{
    func applyStyle()
    {
        style.lineWidth = 0
        style.majorTickStyle.labelFont = UIFont.boldSystemFontOfSize(40)
        style.majorTickStyle.labelColor = .whiteColor()

    }
}

extension SChartSeriesCrosshair
{
    func applyStyle()
    {
        style.defaultFont = UIFont.boldSystemFontOfSize(30)
        style.defaultTextColor = .whiteColor()
    }
}

extension SChartColumnSeries
{
    func applyStyling()
    {
        let columnColor = UIColor(red:0.93, green:0.78, blue:0.34, alpha:1.00)
        style().areaColor = columnColor
        style().areaColorGradient = columnColor
    }
}
