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
    func applyStyling()
    {
        canvasAreaBackgroundColor = .clearColor()
        plotAreaBackgroundColor = .clearColor()
        backgroundColor = .clearColor()
    }
}

extension SChartAxis
{
    func applyStyling()
    {
        style.lineWidth = 0
        style.majorTickStyle.labelFont = UIFont.boldSystemFontOfSize(30)
        style.majorTickStyle.labelColor = .whiteColor()

    }
}

extension SChartSeriesCrosshair
{
    func applyStyling()
    {
        style.defaultFont = UIFont.boldSystemFontOfSize(30)
        style.defaultTextColor = .whiteColor()
    }
}

extension SChartLineSeries
{
    func applyStyling()
    {
        style().lineColor = UIColor(red:0.93, green:0.78, blue:0.34, alpha:1.00)
        style().lineWidth = 5
    }
}

extension SChartDonutSeries
{
    func applyStyling()
    {
        style().flavourColors = [
            UIColor(red:0.97, green:0.32, blue:0.20, alpha:1.00),
            UIColor(red:0.98, green:0.78, blue:0.32, alpha:1.00),
            UIColor(red:0.35, green:0.59, blue:0.79, alpha:1.00),
            UIColor(red:0.45, green:0.84, blue:0.66, alpha:1.00),
            UIColor(red:0.59, green:0.44, blue:0.47, alpha:1.00)
        ]
        
        style().labelFont = UIFont.boldSystemFontOfSize(20)
    }
}