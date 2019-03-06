//
//  Layer.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation


protocol Layer {
    var leftVariable: Variable { get set }
    var rightVariable: Variable { get set }
    
    init(_ variableOne:Variable, _ variableTwo:Variable)
    func forward() -> Variable
    mutating func backward(with variableFromAbove:Variable)

}

extension Layer {
    func printTree() {
        print(self)
        leftVariable.printTree()
        rightVariable.printTree()
    }
}

class PlusLayer: Layer, CustomStringConvertible  {
    var leftVariable: Variable
    var rightVariable: Variable
    
    required init(_ variableOne:Variable, _ variableTwo:Variable) {
        self.leftVariable = variableOne
        self.rightVariable = variableTwo
    }
    
    func forward() -> Variable {
        return Variable(leftVariable.value + rightVariable.value, self)
    }
    
    func backward(with variableFromAbove: Variable) {
        leftVariable.gradient += 1 * variableFromAbove.gradient
        rightVariable.gradient += 1 * variableFromAbove.gradient
        leftVariable.chainableInternalBackward()
        rightVariable.chainableInternalBackward()
    }
    
    var description: String {
        return "PlusLayer"
    }
}

class PlusLayer: Layer, CustomStringConvertible  {
    var leftVariable: Variable
    var rightVariable: Variable
    
    required init(_ variableOne:Variable, _ variableTwo:Variable) {
        self.leftVariable = variableOne
        self.rightVariable = variableTwo
    }
    
    func forward() -> Variable {
        return Variable(leftVariable.value - rightVariable.value, self)
    }
    
    func backward(with variableFromAbove: Variable) {
        leftVariable.gradient += 1 * variableFromAbove.gradient
        rightVariable.gradient += 1 * variableFromAbove.gradient
        leftVariable.chainableInternalBackward()
        rightVariable.chainableInternalBackward()
    }
    
    var description: String {
        return "PlusLayer"
    }
}



class MulLayer: Layer, CustomStringConvertible {
    var leftVariable: Variable
    var rightVariable: Variable
    
    required init(_ variableOne:Variable, _ variableTwo:Variable) {
        self.leftVariable = variableOne
        self.rightVariable = variableTwo
    }
    func forward() -> Variable {
        return Variable(leftVariable.value * rightVariable.value, self)
    }
    
    func backward(with variableFromAbove: Variable) {
        leftVariable.gradient +=  rightVariable.value * variableFromAbove.gradient
        rightVariable.gradient += leftVariable.value * variableFromAbove.gradient
        leftVariable.chainableInternalBackward()
        rightVariable.chainableInternalBackward()
    }
    
    var description: String {
        return "MulLayer"
    }

}





class DivLayer: Layer, CustomStringConvertible {
    var leftVariable: Variable
    var rightVariable: Variable
    
    required init(_ variableOne:Variable, _ variableTwo:Variable) {
        self.leftVariable = variableOne
        self.rightVariable = variableTwo
    }
    func forward() -> Variable {
        return Variable(leftVariable.value / rightVariable.value, self)
    }
    
    func backward(with variableFromAbove: Variable) {
        leftVariable.gradient +=  (1 / rightVariable.value) * variableFromAbove.gradient
        rightVariable.gradient += -(1 / (rightVariable.value * rightVariable.value)) * variableFromAbove.gradient
        leftVariable.chainableInternalBackward()
        rightVariable.chainableInternalBackward()
    }
    
    var description: String {
        return "MulLayer"
    }
    
}



