//
//  CATransform3D+Helper.swift
//  HelloWorld
//
//  Created by Rebekah Baker on 7/17/18.
//  Copyright © 2018 Bekah Baker. All rights reserved.
//

import UIKit

private let defaultPerspective: CGFloat = -1.0 / 500

extension CATransform3D {
    
    enum Axis { case x, y, z }
    
    static var identity: CATransform3D {
        return CATransform3DIdentity
    }
    
    // MARK: - Rotate and Translation
    
    func rotate(_ axis: Axis, by degree: Degree) -> CATransform3D {
        let radians = degree.radians
        switch axis {
        case .x:
            return CATransform3DRotate(self, radians, 1, 0, 0)
        case .y:
            return CATransform3DRotate(self, radians, 0, 1, 0)
        case .z:
            return CATransform3DRotate(self, radians, 0, 0, 1)
        }
    }
    
    func scale(_ axis: Axis, by scale: CGFloat) -> CATransform3D {
        switch axis {
        case .x:
            return CATransform3DScale(self, scale, 1, 1)
        case .y:
            return CATransform3DScale(self, 1, scale, 1)
        case .z:
            return CATransform3DScale(self, 1, 1, scale)
        }
    }
    
    func translate(_ axis: Axis, by value: CGFloat) -> CATransform3D {
        switch axis {
        case .x:
            return CATransform3DTranslate(self, value, 0, 0)
        case .y:
            return CATransform3DTranslate(self, 0, value, 0)
        case .z:
            return CATransform3DTranslate(self, 0, 0, value)
        }
    }
    
    func perspective(_ m34: CGFloat = defaultPerspective) -> CATransform3D {
        var transform = self
        transform.m34 = m34
        return transform
    }
}


// LoginCritter provided by https://github.com/cgoldsby/LoginCritter

//The MIT License (MIT)
//
//Copyright (c) 2016-2017 Chris Goldsby
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in
//all copies or substantial portions of the Software.
