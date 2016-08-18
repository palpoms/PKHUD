//
//  PKHUDAnimation.swift
//  PKHUD
//
//  Created by Piergiuseppe Longo on 06/01/16.
//  Copyright © 2016 Piergiuseppe Longo, NSExceptional. All rights reserved.
//  Licensed under the MIT license.
//

import Foundation
import QuartzCore

public final class PKHUDAnimation {
    
    static let discreteRotation: CAAnimation = {
        let pi_6 = Float(M_PI) / 6.0
        
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        
        var valuesArray: [NSNumber] = []
        var keyTimesArray: [NSNumber] = []
        
        var value: NSNumber
        var keyTime: NSNumber
        
        for i in 0...12 {
            let floatIndex = Float(i)
            value = NSNumber(value: (floatIndex * pi_6))
            valuesArray.append(value)
            
            keyTime = NSNumber(value: (floatIndex/12.0))
            keyTimesArray.append(keyTime)
        }
        
        animation.values = valuesArray
        animation.keyTimes = keyTimesArray
        
        animation.duration = 1.2
        animation.calculationMode = "discrete"
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()

    
    static let continuousRotation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = 2.0 * M_PI
        animation.duration = 1.2
        animation.repeatCount = Float(INT_MAX)
        return animation
    }()
}
