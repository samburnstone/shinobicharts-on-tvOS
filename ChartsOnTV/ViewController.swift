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
    let datasources: [SChartDatasource] = [ChartDatasource(), OSVersionDatasource()]
    
    @IBOutlet var historicalLanguagePopularityChart: SummaryChartView!
    @IBOutlet weak var osVersionBreakdownChart: SummaryChartView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.30, green:0.33, blue:0.40, alpha:1.00)
        
        configureAndStyleHistoricalLanguagePopularityChart()
        configureAndStyleOSVersionBreakdownChart()
    }
}

extension ViewController
{
    func configureAndStyleHistoricalLanguagePopularityChart()
    {
        historicalLanguagePopularityChart.datasource = datasources[0]
        
        let xAxis = SChartDateTimeAxis()
        xAxis.applyStyling()
        
        let yAxis = SChartNumberAxis()
        yAxis.rangePaddingHigh = 5
        yAxis.applyStyling()
        
        historicalLanguagePopularityChart.xAxis = xAxis
        historicalLanguagePopularityChart.yAxis = yAxis
        
        historicalLanguagePopularityChart.applyStyling()
        
        historicalLanguagePopularityChart.crosshair = nil
        
        historicalLanguagePopularityChart.onChartSelection = self.chartSelectionHandler
    }
}

extension ViewController
{
    func configureAndStyleOSVersionBreakdownChart()
    {
        // set relevant datasource once created
        osVersionBreakdownChart.datasource = datasources[1]
        
        osVersionBreakdownChart.applyStyling()
        
        osVersionBreakdownChart.onChartSelection = self.chartSelectionHandler
    }
}

extension ViewController
{
    func chartSelectionHandler(chart: ShinobiChart)
    {
        performSegueWithIdentifier("showChartDetail", sender: chart)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        guard let detailChartViewController = segue.destinationViewController as? DetailChartViewController,
            chart = sender as? ShinobiChart else { return }
        
        detailChartViewController.title = "Show data from \(chart.datasource)"
        detailChartViewController.chartDatasource = chart.datasource
    }
}

