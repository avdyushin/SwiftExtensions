//
//  System.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 18.07.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import Foundation

enum SystemError: ErrorType {
    case unknown
}

struct System {
    
    static func modelName() -> String? {
        return sysctlString([CTL_HW, HW_MODEL])
    }
    
    static func machineName() -> String? {
        return sysctlString([CTL_HW, HW_MACHINE])
    }

    static func sysctlString(levels: [Int32]) -> String? {
        do {
            let (string, _) = try sysctl(levels).withUnsafeBufferPointer { pointer in
                String.fromCStringRepairingIllFormedUTF8(pointer.baseAddress)
            }
            return string
        } catch {
            return nil
        }
    }
    
    static func sysctl(levels: [Int32]) throws -> [Int8] {
        return try levels.withUnsafeBufferPointer { levelPointer in
            var size = 0
            guard Darwin.sysctl(UnsafeMutablePointer<Int32>(levelPointer.baseAddress), UInt32(levels.count), nil, &size, nil, 0) == 0 else {
                throw POSIXError(rawValue: errno) ?? SystemError.unknown
            }
            let buffer = Array<Int8>(count: size, repeatedValue: 0)
            let result = buffer.withUnsafeBufferPointer { bufferPointer in
                return Darwin.sysctl(UnsafeMutablePointer<Int32>(levelPointer.baseAddress), UInt32(levels.count), UnsafeMutablePointer<Void>(bufferPointer.baseAddress), &size, nil, 0)
            }
            guard result == 0 else {
                throw POSIXError(rawValue: errno) ?? SystemError.unknown
            }
            return buffer
        }
    }
    
}
