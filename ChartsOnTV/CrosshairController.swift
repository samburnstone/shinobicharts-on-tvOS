//
//  CrosshairController.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 01/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

import Foundation

class CrosshairController: NSObject
{
    let chart: ShinobiChart
    
    var crosshairShowing = false
    
    let panToNeighbouringPointThreshold: CGFloat = 100
    private var crosshairPositionContext = CrosshairPositionContext()
    
    init(chart: ShinobiChart)
    {
        self.chart = chart
        
        super.init()
        
        // Setting this disables the pan gesture recognizer
        self.chart.gestureManager.panType = .None
        
        // Add gesture recognizer for showing/hiding crosshair
        let tapRecognizer = UITapGestureRecognizer(target: self, action:#selector(self.toggleCrosshair(_:)))
        let select = UIPressType.Select.rawValue
        tapRecognizer.allowedPressTypes = [NSNumber(integer: select)]
        self.chart.addGestureRecognizer(tapRecognizer)
        
        // Detect panning across the remote
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.moveCrosshair(_:)))
        panRecognizer.delegate = self
        self.chart.addGestureRecognizer(panRecognizer)
    }
    
    @objc private func toggleCrosshair(recognizer: UITapGestureRecognizer)
    {
        crosshairShowing = !crosshairShowing
        
        if !crosshairShowing
        {
            chart.crosshair?.hide()
            return
        }
        
        crosshairPositionContext.resetDataIndex()
        
        chart.crosshair?.showAtPoint(pointLocationForDataPointAtIndex(crosshairPositionContext.dataIndex), inChart: chart)
    }
    
    @objc private func moveCrosshair(recognizer: UIPanGestureRecognizer)
    {
        let xPos = recognizer.locationInView(chart).x
        
        switch recognizer.state
        {
        case .Began:
            crosshairPositionContext.beginTrackingAtXPosition(xPos)
        default: break
        }
        
        if (crosshairShowing)
        {
            let diff = crosshairPositionContext.distanceBetweenStartPositionAndCurrentXPosition(xPos)
            
            let maxIndex = chart.series[0].dataSeries.dataPoints.count - 1
            let unclampedDataIndex = crosshairPositionContext.startingDataIndexWhenTouchBegan + Int(diff / panToNeighbouringPointThreshold)
            
            let clampedDataIndex = clamp(unclampedDataIndex, lower: 0, upper: maxIndex)
            
            crosshairPositionContext.dataIndex = clampedDataIndex
        }
        
        chart.crosshair?.moveToPoint(pointLocationForDataPointAtIndex(crosshairPositionContext.dataIndex), inChart: chart)
    }
    
    private func pointLocationForDataPointAtIndex(index: Int) -> CGPoint
    {
        let dataPoint = chart.series[0].dataSeries.dataPoints[index]
        
        let xValue = chart.xAxis!.pixelValueForDataValue(dataPoint.sChartXValue()!)
        let yValue = chart.yAxis!.pixelValueForDataValue(dataPoint.sChartYValue()!)
        
        return CGPoint(x: xValue, y: yValue)
    }
    
    // From http://blog.shiftybit.net/2015/06/clampinswift/
    private func clamp<T: Comparable>(value: T, lower: T, upper: T) -> T {
        return min(max(value, lower), upper)
    }
}

extension CrosshairController: UIGestureRecognizerDelegate
{
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
