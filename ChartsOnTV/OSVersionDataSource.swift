//
//  OSVersionDataSource.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 15/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

import Foundation

private struct OSVersion
{
    let name: String
    let proportion: Double
}

class OSVersionDatasource: NSObject, SChartDatasource
{
    
    private let osVersionData = [
        OSVersion(name: "9.3", proportion: 45),
        OSVersion(name: "9.2", proportion: 25),
        OSVersion(name: "9.1", proportion: 15),
        OSVersion(name: "9.1", proportion: 10),
        OSVersion(name: "8", proportion: 5)
    ]
    
    func numberOfSeriesInSChart(chart: ShinobiChart) -> Int
    {
        return 1
    }
    
    func sChart(chart: ShinobiChart, seriesAtIndex index: Int) -> SChartSeries
    {
        let series = SChartPieSeries()
        series.applyStyling()
        return series;
    }
    
    func sChart(chart: ShinobiChart, numberOfDataPointsForSeriesAtIndex seriesIndex: Int) -> Int
    {
        return osVersionData.count
    }
    
    func sChart(chart: ShinobiChart, dataPointAtIndex dataIndex: Int, forSeriesAtIndex seriesIndex: Int) -> SChartData
    {
        let osVersion = osVersionData[dataIndex];
        return SChartDataPoint(XValue: osVersion.name, yValue: osVersion.proportion)
    }
    
}
