//
//  UITraitCollection.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 18.07.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import UIKit

extension UITraitCollection {
    
    /// Device types based on screen inches.
    /// `RawValue` is max device width in pixels
    enum DeviceWidthInInches: Float {
        case unpecified      = 0.0
        case iphone_3_5_inch = 480.0
        case iphone_4_inch   = 568.0
        case iphone_4_7_inch = 667.0
        case iphone_5_5      = 736.0
        case ipad            = 1024.0
        case ipad_pro        = 1366.0
    }
    
    /// Returns max device screen width.
    var maxDeviceWidth: Float {
        return fmax(Float(UIScreen.mainScreen().bounds.width),
                    Float(UIScreen.mainScreen().bounds.height))
    }
    
    /// Returns device type by screen inches.
    var deviceInches: DeviceWidthInInches {
        return DeviceWidthInInches(rawValue: maxDeviceWidth) ?? DeviceWidthInInches.unpecified
    }
    
}
