//
//  CrosshairPositionContext.swift
//  ChartsOnTV
//
//  Created by Samuel Burnstone on 11/04/2016.
//  Copyright © 2016 ShinobiControls. All rights reserved.
//

import Foundation

struct CrosshairPositionContext
{
    private var touchStartLocationX: CGFloat = 0
    private(set) var startingDataIndexWhenTouchBegan = 0
    var dataIndex = 0
    
    mutating func resetDataIndex()
    {
        dataIndex = 0
    }
    
    mutating func beginTrackingAtXPosition(xPosition: CGFloat)
    {
        touchStartLocationX = xPosition
        startingDataIndexWhenTouchBegan = dataIndex
    }

    func distanceBetweenStartPositionAndCurrentXPosition(xPosition: CGFloat) -> CGFloat
    {
        return xPosition - touchStartLocationX
    }
}