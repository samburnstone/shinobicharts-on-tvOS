//
//  TVChart.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 11/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

import Foundation

class TVChart: ShinobiChart
{
    private var crosshairController: CrosshairController?
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit()
    {
        crosshairController = CrosshairController(chart: self)
    }
}

extension TVChart
{
    override func canBecomeFocused() -> Bool
    {
        return true
    }
}

extension TVChart
{
    func zoomIn()
    {
        let newMinimum = xAxis!.range.minimum.doubleValue + 0.5
        let newMaximum = xAxis!.range.maximum.doubleValue - 0.5
        
        xAxis?.setRange(SChartRange(minimum: newMinimum, andMaximum: newMaximum), withAnimation: true)
    }
    
    func zoomOut()
    {
        let newMinimum = xAxis!.range.minimum.doubleValue - 0.5
        let newMaximum = xAxis!.range.maximum.doubleValue + 0.5
        
        xAxis?.setRange(SChartRange(minimum: newMinimum, andMaximum: newMaximum), withAnimation: true)
    }
}
