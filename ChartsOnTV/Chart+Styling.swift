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