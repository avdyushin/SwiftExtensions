//
//  SwiftExtensionsTests.swift
//  SwiftExtensionsTests
//
//  Created by Grigory Avdyushin on 01.06.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import XCTest
@testable import SwiftExtensions

struct Page: Hashable {
    var order: Int
    init(_ order: Int) { self.order = order }
    var hashValue: Int { return order }
}

func ==(lhs: Page, rhs: Page) -> Bool {
    return lhs.order == rhs.order
}

class SwiftExtensionsTests: XCTestCase {
    
    func testFixedSizeBuffer() {
        var buffer = FixedSizeOrderedSet<Int>(maximumSize: 3)
        for i in 0..<10 {
            buffer.append(i)
        }
        XCTAssertEqual(buffer.count, 3)
        XCTAssertEqual(buffer[0], 7)
        XCTAssertEqual(buffer[1], 8)
        XCTAssertEqual(buffer[2], 9)
    }
    
    func testFixedSizeBuffer2() {
        var buffer = FixedSizeOrderedSet<Page>(maximumSize: 3) { new, old in
            return abs(old.order.distanceTo(new.order)) < 3
        }
        
        for i in 0..<10 {
            buffer.append(Page(i))
        }
        XCTAssertEqual(buffer.count, 3)
        XCTAssertEqual(buffer[0]?.order, 7)
        XCTAssertEqual(buffer[1]?.order, 8)
        XCTAssertEqual(buffer[2]?.order, 9)

        for i in 0..<10 {
            buffer.append(Page(9 - i))
        }
        XCTAssertEqual(buffer.count, 3)
        XCTAssertEqual(buffer[0]?.order, 2)
        XCTAssertEqual(buffer[1]?.order, 1)
        XCTAssertEqual(buffer[2]?.order, 0)

        buffer.append(Page(1))
        buffer.append(Page(2))
        buffer.append(Page(3))
        buffer.append(Page(2)) // Same hash value
        XCTAssertEqual(buffer.count, 3)
        XCTAssertEqual(buffer[0]?.order, 2)
        XCTAssertEqual(buffer[1]?.order, 1)
        XCTAssertEqual(buffer[2]?.order, 3)
        
        let removed = buffer.append(Page(20))
        print(removed)
        XCTAssertEqual(buffer.count, 1)
        XCTAssertEqual(buffer[0]?.order, 20)
        
        buffer.append(Page(30))
        XCTAssertEqual(buffer.count, 2)
        XCTAssertEqual(buffer[0]?.order, 20)
        XCTAssertEqual(buffer[1]?.order, 30)
        
        for i in 31..<33 {
            buffer.append(Page(i))
        }
        XCTAssertEqual(buffer.count, 3)
        XCTAssertEqual(buffer[0]?.order, 30)
        XCTAssertEqual(buffer[1]?.order, 31)
        XCTAssertEqual(buffer[2]?.order, 32)
        
        XCTAssertNotNil(buffer.allElements.filter { $0.order == 30 }.first)
        XCTAssertNotNil(buffer.allElements.filter { $0.order == 31 }.first)
        XCTAssertNotNil(buffer.allElements.filter { $0.order == 32 }.first)
    }
    
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
