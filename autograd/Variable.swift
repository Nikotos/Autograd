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
    
    init(_ value: Float) {
        self.value = value
    }
    
    init(_ value: Float, _ parentLayer: Layer) {
        self.value = value
        self.parentLayer = parentLayer
    }
    
    var description: String {
        return "(value - \(self.value), gradient - \(self.gradient), parentLayer - \(self.parentLayer)))"
    }
    
    func backward() {
        self.gradient = 1
        parentLayer?.backward(with: self)
    }
    
    func chainableInternalBackward() {
        parentLayer?.backward(with: self)
    }
    
    func printTree() {
        print(self)
        self.parentLayer?.printTree()
        
    }
}
