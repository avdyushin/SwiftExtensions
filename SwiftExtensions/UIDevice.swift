//
//  Device.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 29.01.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import UIKit

extension UIDevice {
    
    /// Device types based on screen inches.
    /// `RawValue` is max device width in pixels
    enum DeviceTypeByInches: Float {
        case unpecified      = 0.0
        case iphone_3_5_inch = 480.0
        case iphone_4_inch   = 568.0
        case iphone_4_7_inch = 667.0
        case iphone_5_5_inch = 736.0
        case ipad            = 1024.0
        case ipad_pro        = 1366.0
    }
    
    /// Returns device type based on max screen width in inches
    class var deviceType: DeviceTypeByInches {
        return DeviceTypeByInches(rawValue: UIScreen.maxDeviceWidth) ?? .unpecified
    }

    /// Returns true if user interface idiom `.Phone`
    class var isPhone: Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Phone
    }

    /// Returns true if user interface idiom `.Pad`
    class var isPad: Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .Pad
    }
    
    /// Returns true if screen size for iPad Pro
    class var isPadPro: Bool {
        return isPad && UIScreen.maxDeviceWidth == DeviceTypeByInches.ipad_pro.rawValue
    }
    
    /// Returns true if user interface idiom `.TV`
    class var isTV: Bool {
        return UIDevice.currentDevice().userInterfaceIdiom == .TV
    }
    
    /// Returns true if screen size for iPhone 4/4S
    class var isPhone4: Bool {
        return isPhone && UIScreen.maxDeviceWidth == DeviceTypeByInches.iphone_3_5_inch.rawValue
    }

    /// Returns true if screen size for iPhone 5/5S
    class var isPhone5: Bool {
        return isPhone && UIScreen.maxDeviceWidth == DeviceTypeByInches.iphone_4_inch.rawValue
    }
    
    /// Returns true if screen size for iPhone 6/6S
    class var isPhone6: Bool {
        return isPhone && UIScreen.maxDeviceWidth == DeviceTypeByInches.iphone_4_7_inch.rawValue
    }
    
    /// Returns true if screen size for iPhone 6+/6S+
    class var isPhone6Plus: Bool {
        return isPhone && UIScreen.maxDeviceWidth == DeviceTypeByInches.iphone_5_5_inch.rawValue
    }
    
}
