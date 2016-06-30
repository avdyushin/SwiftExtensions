//
//  Collections.swift
//  SwiftExtensions
//
//  Created by Grigory Avdyushin on 29.06.16.
//  Copyright © 2016 Grigory Avdyushin. All rights reserved.
//

import Foundation

/// Fixed size ordered set
struct FixedSizeOrderedSet<Element: Hashable> {
    
    /// Number of elements
    var count: Int { return self.allElements.count }
    /// Predicate to remove old elements
    var predicate: ((new: Element, old: Element) -> Bool)?
    /// Elements storage
    var allElements = [Element]()
    /// Maximum number of elements
    private var maximumSize: Int
    ///
    init(maximumSize: Int, predicate: ((new: Element, old: Element) -> Bool)? = nil) {
        self.maximumSize = maximumSize
        self.predicate = predicate
    }
    /// Appends new element and return removed elements
    internal mutating func append(newElement: Element) -> [Element] {
        
        guard allElements.contains({ $0 == newElement }) == false else { return [] }
        
        var removed = [Element]()
        if allElements.count >= maximumSize {
            if let predicate = predicate {
                removed = allElements.filter { element in
                    return !predicate(new: newElement, old: element)
                }
                allElements = allElements.filter { element in
                    return predicate(new: newElement, old: element)
                }
            } else {
                removed.append(allElements.removeFirst())
            }
        }
        allElements.append(newElement)
        return removed
        
    }
    
}

extension FixedSizeOrderedSet: Indexable {
    
    typealias Index = Int
    var startIndex: Index { return self.allElements.startIndex }
    var endIndex: Index { return self.allElements.endIndex }
    subscript (position: Index) -> Element? {
        return self.allElements[position]
    }
    
}
