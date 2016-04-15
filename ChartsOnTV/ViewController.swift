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
    
    @IBOutlet var historicalLanguagePopularityChart: ShinobiChart!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.30, green:0.33, blue:0.40, alpha:1.00)
        
        configureAndStyleHistoricalLanguagePopularityChart()
    }
}


extension ViewController
{
    func configureAndStyleHistoricalLanguagePopularityChart()
    {
        historicalLanguagePopularityChart.datasource = datasource
        
        let xAxis = SChartCategoryAxis()
        xAxis.applyStyle()
        
        let yAxis = SChartNumberAxis()
        yAxis.rangePaddingHigh = 5
        yAxis.applyStyle()
        
        historicalLanguagePopularityChart.xAxis = xAxis
        historicalLanguagePopularityChart.yAxis = yAxis
        
        historicalLanguagePopularityChart.applyStyle()
        
        let crosshair = SChartSeriesCrosshair()
        crosshair.applyStyle()
        historicalLanguagePopularityChart.crosshair = crosshair
        
        historicalLanguagePopularityChart.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
    }
}

