//
//  ViewController.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 01/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Datasource is not retained by chart... therefore need to keep a reference to it ourself
    let datasource = ChartDatasource()
    let chart: ShinobiChart = {
        let chart = ShinobiChart(frame: CGRectZero)
        
        let xAxis = SChartCategoryAxis()
        xAxis.applyStyle()
        
        let yAxis = SChartNumberAxis()
        yAxis.rangePaddingHigh = 5
        yAxis.applyStyle()
        
        chart.xAxis = xAxis
        chart.yAxis = yAxis
        
        chart.applyStyle()
        
        return chart
    }()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.30, green:0.33, blue:0.40, alpha:1.00)
        
        chart.datasource = datasource
        view.addSubview(chart)
        
        chart.translatesAutoresizingMaskIntoConstraints = false
        
        chart.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
        chart.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        chart.rightAnchor.constraintEqualToAnchor(view.rightAnchor).active = true
        chart.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
    }

}

