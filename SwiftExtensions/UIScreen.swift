//
//  UIScreen.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 18.07.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import UIKit

extension UIScreen {
    
    /// Returns max device main screen width
    static var maxDeviceWidth: Float {
        return fmax(Float(UIScreen.mainScreen().bounds.width),
                    Float(UIScreen.mainScreen().bounds.height))
    }
    
}
