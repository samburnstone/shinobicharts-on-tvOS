//
//  ChartDatasource.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 01/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

private struct ProgrammingLanguage
{
    let name: String
    let popularity: Double
}

class ChartDatasource: NSObject, SChartDatasource
{
    private let popularityData = [ProgrammingLanguage(name: "Java", popularity: 24.1),
                          ProgrammingLanguage(name: "Python", popularity: 12.1),
                          ProgrammingLanguage(name: "PHP", popularity: 10.6),
                          ProgrammingLanguage(name: "C#", popularity: 8.8),
                          ProgrammingLanguage(name: "C++", popularity: 7.5),
                          ProgrammingLanguage(name: "C", popularity: 7.4),
                          ProgrammingLanguage(name: "C#", popularity: 8.8),
                          ProgrammingLanguage(name: "Other", popularity: 22.1)]
    
    func numberOfSeriesInSChart(chart: ShinobiChart) -> Int
    {
        return 1
    }
    
    func sChart(chart: ShinobiChart, seriesAtIndex index: Int) -> SChartSeries
    {
        let series = SChartColumnSeries()
        series.applyStyling()
        return series;
    }
    
    func sChart(chart: ShinobiChart, numberOfDataPointsForSeriesAtIndex seriesIndex: Int) -> Int
    {
        return popularityData.count
    }
    
    func sChart(chart: ShinobiChart, dataPointAtIndex dataIndex: Int, forSeriesAtIndex seriesIndex: Int) -> SChartData
    {
        let language = popularityData[dataIndex];
        return SChartDataPoint(XValue: language.name, yValue: language.popularity)
    }
    
}
