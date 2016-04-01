//
//  Series+Styling.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 01/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

import Foundation

extension SChartColumnSeries
{
    func applyStyling()
    {
        let columnColor = UIColor(red:0.93, green:0.78, blue:0.34, alpha:1.00)
        style().areaColor = columnColor
        style().areaColorGradient = columnColor
    }
}