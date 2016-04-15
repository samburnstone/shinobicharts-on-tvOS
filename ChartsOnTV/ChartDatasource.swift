//
//  ChartDatasource.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 01/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

private struct Crash
{
    let date: String
    let numberOfCrashes: Int
}

class ChartDatasource: NSObject, SChartDatasource
{
    private lazy var dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }()
    
    private let crashData = [
        Crash(date:"2015-01-01", numberOfCrashes: 100),
        Crash(date:"2015-02-01", numberOfCrashes: 91),
        Crash(date:"2015-03-01", numberOfCrashes: 75),
        Crash(date:"2015-04-01", numberOfCrashes: 50),
        Crash(date:"2015-05-01", numberOfCrashes: 10),
        Crash(date:"2015-06-01", numberOfCrashes: 80),
        Crash(date:"2015-07-01", numberOfCrashes: 60),
        Crash(date:"2015-08-01", numberOfCrashes: 60),
        Crash(date:"2015-09-01", numberOfCrashes: 55),
        Crash(date:"2015-10-01", numberOfCrashes: 40),
        Crash(date:"2015-11-01", numberOfCrashes: 30),
        Crash(date:"2015-12-01", numberOfCrashes: 8)
    ]
    
    func numberOfSeriesInSChart(chart: ShinobiChart) -> Int
    {
        return 1
    }
    
    func sChart(chart: ShinobiChart, seriesAtIndex index: Int) -> SChartSeries
    {
        let series = SChartLineSeries()
        series.applyStyling()
        series.crosshairEnabled = true
        return series;
    }
    
    func sChart(chart: ShinobiChart, numberOfDataPointsForSeriesAtIndex seriesIndex: Int) -> Int
    {
        return crashData.count
    }
    
    func sChart(chart: ShinobiChart, dataPointAtIndex dataIndex: Int, forSeriesAtIndex seriesIndex: Int) -> SChartData
    {
        let crash = crashData[dataIndex];
        return SChartDataPoint(XValue: dateFormatter.dateFromString(crash.date)!, yValue: crash.numberOfCrashes)
    }
    
}
