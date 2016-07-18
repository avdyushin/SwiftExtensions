//
//  UITraitCollection.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 18.07.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import UIKit

extension UITraitCollection {
        
    /// Returns max device screen width.
    var maxDeviceWidth: Float {
        return UIScreen.maxDeviceWidth
    }
    
    /// Returns device type by screen inches.
    var deviceInches: UIDevice.DeviceTypeByInches {
        return UIDevice.deviceType
    }
    
}
