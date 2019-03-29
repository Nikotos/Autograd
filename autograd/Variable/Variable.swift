//
//  Variable.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
//
// Main Unit ofmwhole our autograd system


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



extension Variable {
    public static func random(in myRange: ClosedRange<Float32>) -> Variable {
        return Variable(Float32.random(in: myRange))
    }
}
