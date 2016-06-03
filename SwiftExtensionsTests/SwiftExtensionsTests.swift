//
//  SwiftExtensionsTests.swift
//  SwiftExtensionsTests
//
//  Created by Grigory Avdyushin on 01.06.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import XCTest
@testable import SwiftExtensions

class SwiftExtensionsTests: XCTestCase {
    
    func testWhite() {
        let color = UIColor(hex: 0xffffff)
        var red = CGFloat(0), green = CGFloat(0), blue = CGFloat(0), alpha = CGFloat(0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1)
        XCTAssertEqual(green, 1)
        XCTAssertEqual(blue, 1)
        XCTAssertEqual(alpha, 1)
    }

    func testBlack() {
        let color = UIColor(hex: 0)
        var red = CGFloat(0), green = CGFloat(0), blue = CGFloat(0), alpha = CGFloat(0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 1)
    }
    
    func testGray() {
        let color = UIColor(hex: 0x808080)
        var red = CGFloat(0), green = CGFloat(0), blue = CGFloat(0), alpha = CGFloat(0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqualWithAccuracy(red, 0.5, accuracy: 0.1)
        XCTAssertEqualWithAccuracy(green, 0.5, accuracy: 0.1)
        XCTAssertEqualWithAccuracy(blue, 0.5, accuracy: 0.1)
    }

    func testAlpha() {
        let color = UIColor(string: "#00ff0080")
        var red = CGFloat(0), green = CGFloat(0), blue = CGFloat(0), alpha = CGFloat(0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqualWithAccuracy(alpha, 0.5, accuracy: 0.1)
    }
    
    
    func testWhiteString() {
        let color = UIColor(string: "#ffffff")
        var red = CGFloat(0), green = CGFloat(0), blue = CGFloat(0), alpha = CGFloat(0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 1)
        XCTAssertEqual(green, 1)
        XCTAssertEqual(blue, 1)
        XCTAssertEqual(alpha, 1)
    }

    func testBlackString() {
        let color = UIColor(string: "#000")
        var red = CGFloat(0), green = CGFloat(0), blue = CGFloat(0), alpha = CGFloat(0)
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        XCTAssertEqual(red, 0)
        XCTAssertEqual(green, 0)
        XCTAssertEqual(blue, 0)
        XCTAssertEqual(alpha, 1)
    }

    func testUIImage() {
        
        if let image = UIImage(color: UIColor.orangeColor(), size: CGSizeMake(100, 200)) {
            
            XCTAssertEqual(image.size.width, 100 * UIScreen.mainScreen().scale)
            XCTAssertEqual(image.size.height, 200 * UIScreen.mainScreen().scale)

            let resized = image.resize(50)
            XCTAssertEqual(resized.size.width, 50)
            XCTAssertEqual(resized.size.height, 100)

        }
        
        
    }
}
