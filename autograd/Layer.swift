//
//  Layer.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation


protocol Layer {
    func forward() -> Variable
    func backward(with variableFromAbove:Variable)
}

class BinaryLayer: Layer, CustomStringConvertible {
    var leftVariable: Variable
    var rightVariable: Variable
    
    init(_ variableOne:Variable, _ variableTwo:Variable) {
        self.leftVariable = variableOne
        self.rightVariable = variableTwo
    }
    
    func forward() -> Variable { return Variable(0) }
    func backward(with variableFromAbove: Variable) {}
    
    func chainableInternalBackward() {
        leftVariable.chainableInternalBackward()
        rightVariable.chainableInternalBackward()
    }
    
    var description: String {
        return "DefaultBinaryLayer"
    }
}

class UnaryLayer: Layer, CustomStringConvertible {
    var variable: Variable
    
    init(_ variable: Variable) {
        self.variable = variable
    }
    
    func forward() -> Variable {return Variable(0)}
    
    func backward(with variableFromAbove: Variable) {}
    
    func chainableInternalBackward() {
        variable.chainableInternalBackward()
    }
    var description: String {
        return "DefaultUnaryLayer"
    }
}


