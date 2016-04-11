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
