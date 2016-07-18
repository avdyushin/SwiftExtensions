//
//  Device.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 29.01.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import UIKit

/// Apple device models
// Based on https://www.theiphonewiki.com/wiki/Models
enum Models: String {
    
    case iPodTouch    = "iPod Touch"
    case iPodTouch2G  = "iPod Touch 2G"
    case iPodTouch3G  = "iPod Touch 3G"
    case iPodTouch4G  = "iPod Touch 4G"
    case iPodTouch5G  = "iPod Touch 5G"
    case iPodTouch6G  = "iPod Touch 6G"
    
    case iPhone       = "iPhone"
    case iPhone3G     = "iPhone 3G"
    case iPhone3GS    = "iPhone 3GS"
    case iPhone4      = "iPhone 4"
    case iPhone4s     = "iPhone 4S"
    case iPhone5      = "iPhone 5"
    case iPhone5c     = "iPhone 5C"
    case iPhone5s     = "iPhone 5S"
    case iPhone6      = "iPhone 6"
    case iPhone6s     = "iPhone 6S"
    case iPhone6Plus  = "iPhone 6 Plus"
    case iPhone6sPlus = "iPhone 6S Plus"
    case iPhoneSE     = "iPhone SE"
    
    case iPad         = "iPad"
    case iPad2        = "iPad 2"
    case iPad3        = "iPad 3"
    case iPad4        = "iPad 4"
    
    case iPadAir      = "iPad Air"
    case iPadAir2     = "iPad Air 2"
    
    case iPadPro12    = "iPad Pro (12.9 inch)"
    case iPadPro9     = "iPad Pro (9.7 inch"
    
    case iPadMini     = "iPad Mini"
    case iPadMini2    = "iPad Mini 2"
    case iPadMini3    = "iPad Mini 3"
    case iPadMini4    = "iPad Mini 4"
    
    case TV2G         = "Apple TV 2G"
    case TV3G         = "Apple TV 3G"
    case TV4G         = "Apple TV 4G"
    case Watch        = "Apple Watch"
    
    case simulator    = "Simulator"
    case unknown      = "Unknown"
    
    init?(machine: String) {
        switch machine {
            
        case "iPhone1,1": self = .iPhone
        case "iPhone1,2": self = .iPhone3G
        case "iPhone2,1": self = .iPhone3GS
        case "iPhone3,1": self = .iPhone4
        case "iPhone3,3": self = .iPhone4
        case "iPhone4,1": self = .iPhone4s
        case "iPhone5,1": self = .iPhone5
        case "iPhone5,2": self = .iPhone5
        case "iPhone5,3": self = .iPhone5c
        case "iPhone5,4": self = .iPhone5c
        case "iPhone6,1": self = .iPhone5s
        case "iPhone6,2": self = .iPhone5s
        case "iPhone7,2": self = .iPhone6
        case "iPhone7,1": self = .iPhone6Plus
        case "iPhone8,1": self = .iPhone6s
        case "iPhone8,2": self = .iPhone6sPlus
        case "iPhone8,4": self = .iPhoneSE
            
        case "iPod1,1": self = .iPodTouch
        case "iPod2,1": self = .iPodTouch2G
        case "iPod3,1": self = .iPodTouch3G
        case "iPod4,1": self = .iPodTouch4G
        case "iPod5,1": self = .iPodTouch5G
        case "iPod7,1": self = .iPodTouch6G
            
        case "iPad1,1": self = .iPad
        case "iPad2,1": self = .iPad2
        case "iPad2,2": self = .iPad2
        case "iPad2,3": self = .iPad2
        case "iPad2,4": self = .iPad2
        case "iPad3,1": self = .iPad3
        case "iPad3,2": self = .iPad3
        case "iPad3,3": self = .iPad3
        case "iPad3,4": self = .iPad4
        case "iPad3,5": self = .iPad4
        case "iPad3,6": self = .iPad4
            
        case "iPad4,1": self = .iPadAir
        case "iPad4,2": self = .iPadAir
        case "iPad4,3": self = .iPadAir
            
        case "iPad5,3": self = .iPadAir2
        case "iPad5,4": self = .iPadAir2

        case "iPad6,3": self = .iPadPro9
        case "iPad6,4": self = .iPadPro9

        case "iPad6,7": self = .iPadPro12
        case "iPad6,8": self = .iPadPro12
            
        case "iPad2,5": self = .iPadMini
        case "iPad2,6": self = .iPadMini
        case "iPad2,7": self = .iPadMini
            
        case "iPad4,4": self = .iPadMini2
        case "iPad4,5": self = .iPadMini2
        case "iPad4,6": self = .iPadMini2
            
        case "iPad4,7": self = .iPadMini3
        case "iPad4,8": self = .iPadMini3
        case "iPad4,9": self = .iPadMini3
            
        case "iPad5,1": self = .iPadMini4
        case "iPad5,2": self = .iPadMini4
            
        case "Watch1,1": self = .Watch
        case "Watch1,2": self = .Watch
            
        case "AppleTV2,1": self = .TV2G

        case "AppleTV3,1": self = .TV3G
        case "AppleTV3,2": self = .TV3G
            
        case "AppleTV5,3": self = .TV4G
            
        case "i386":    self = .simulator
        case "x86_64":  self = .simulator
            
        default:
            return nil
        }
    }
}

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
    
    /// Returns device type
    class var model: Models {
        return Models(machine: machineName) ?? .unknown
    }
    
    /// Returns device type string
    class var modelName: String {
        return model.rawValue
    }
        
    private class var machineName: String {
        return System.machineName() ?? "Unknown"
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
