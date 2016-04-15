//
//  SummaryChartView.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 15/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//
class SummaryChartView: TVChart
{
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
        let tapRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.chartSelected))
        let select = UIPressType.Select.rawValue
        tapRecognizer.allowedPressTypes = [NSNumber(integer: select)]
        self.addGestureRecognizer(tapRecognizer)
    }
}

extension SummaryChartView
{
    func chartSelected()
    {
        print("Selected chart")
    }
}
