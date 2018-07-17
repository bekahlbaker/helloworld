//
//  Degree.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/17/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

struct Degree {
    
    let value: Double
    
    var radians: CGFloat {
        return CGFloat(value * Double.pi / 180.0)
    }
}

// MARK - Negative Degrees

prefix func -(degree: Degree) -> Degree {
    return Degree(value: -1 * degree.value)
}

// MARK: - Double

extension Double {
    
    var degrees: Degree {
        return Degree(value: self)
    }
}

