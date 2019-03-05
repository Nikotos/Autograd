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
    var gradient = Float(1)
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
        parentLayer?.backward(with: self)
    }
    
    func printTree() {
        print(self)
        self.parentLayer?.printTree()
        
    }
}

func +(left: Variable, right: Variable) -> Variable {
    let parentLayer = PlusLayer(left, right)
    return parentLayer.forward()
}

func *(left: Variable, right: Variable) -> Variable {
    let parentLayer = MulLayer(left, right)
    return parentLayer.forward()
}

func /(left: Variable, right: Variable) -> Variable {
    let parentLayer = DivLayer(left,right)
    return parentLayer.forward()
}
