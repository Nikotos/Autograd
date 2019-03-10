//
//  Variable.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

class Variable: CustomStringConvertible {
    var value = Float(0)
    var gradient = Float(0)
    var parentLayer: Layer?
    
    var doCalculateGradient:Bool = true
    
    init(_ value: Float) {
        self.value = value
    }
    
    init(_ value: Float, _ parentLayer: Layer) {
        self.value = value
        self.parentLayer = parentLayer
    }
    
    init (_ value: Float, doCalculateGradient flag: Bool) {
        self.doCalculateGradient = flag
    }
    
    var description: String {
        return "(value - \(self.value), gradient - \(self.gradient), parentLayer - \(self.parentLayer)))"
    }
    
    func backward() {
        self.gradient = 1
        parentLayer?.backward(with: self)
    }
    
    func chainableInternalBackward() {
        if doCalculateGradient {
            parentLayer?.backward(with: self)
        }
    }
    
    func zeroGrad() {
        self.gradient = 0
    }
}
