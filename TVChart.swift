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
        self.clipsToBounds = false // Disable clipping so we get shadow effect
    }
}

extension TVChart
{
    override func canBecomeFocused() -> Bool
    {
        return true
    }
    
    // Called when transitioning to or from chart
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator)
    {
        super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
        
        if context.nextFocusedView == self
        {
            // Add focus
            self.becomeFocusedUsingAnimationCoordinator(coordinator)
            self.addParallaxMotionEffects()
        }
        else
        {
            // Remove focus
            self.resignFocusUsingAnimationCoordinator(coordinator)
            self.motionEffects = []
        }
    }
    
    func becomeFocusedUsingAnimationCoordinator(coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            self.transform = CGAffineTransformMakeScale(1.1, 1.1)
            self.layer.shadowColor = UIColor.blackColor().CGColor
            self.layer.shadowOffset = CGSizeMake(10, 10)
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 10
        }, completion: nil)
    }
    
    func resignFocusUsingAnimationCoordinator(coordinator: UIFocusAnimationCoordinator) {
        coordinator.addCoordinatedAnimations({
            self.transform = CGAffineTransformIdentity
            self.layer.shadowColor = nil
            self.layer.shadowOffset = CGSizeZero
            self.layer.shadowOpacity = 0
            self.layer.shadowRadius = 0
        }, completion: nil)
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
