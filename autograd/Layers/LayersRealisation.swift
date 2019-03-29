//
//  LayersImplementation.swift
//  autograd
//
//  Created by Oak Nick on 06/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
//  Implementation of computational units - i.e. blocks 

import Foundation

class PlusLayer: BinaryLayer  {
    override func forward() -> Variable {
        return Variable(leftVariable.value + rightVariable.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable.gradient += 1 * variableFromAbove.gradient
        rightVariable.gradient += 1 * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    override var description: String {
        return "PlusLayer"
    }
}

class MinusLayer: BinaryLayer {
    override func forward() -> Variable {
        return Variable(leftVariable.value - rightVariable.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable.gradient += 1 * variableFromAbove.gradient
        rightVariable.gradient += 1 * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "MinusLayer"
    }
}


class MulLayer: BinaryLayer {
    
    override func forward() -> Variable {
        return Variable(leftVariable.value * rightVariable.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable.gradient +=  rightVariable.value * variableFromAbove.gradient
        rightVariable.gradient += leftVariable.value * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "MulLayer"
    }
}


class DivLayer: BinaryLayer {
    override func forward() -> Variable {
        return Variable(leftVariable.value / rightVariable.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable.gradient +=  (1 / rightVariable.value) * variableFromAbove.gradient
        rightVariable.gradient += -(1 / (rightVariable.value * rightVariable.value)) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "MulLayer"
    }
}

class PowLayer: BinaryLayer {
    override func forward() -> Variable {
        return Variable(pow(leftVariable.value, rightVariable.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable.gradient +=  rightVariable.value * pow(leftVariable.value, rightVariable.value - 1) * variableFromAbove.gradient
        rightVariable.gradient += log(leftVariable.value) * pow(leftVariable.value, rightVariable.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "PowLayer"
    }
}

class SinLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(sin(variable.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        variable.gradient +=  cos(variable.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "SinLayer"
    }
}

class CosLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(cos(variable.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        variable.gradient +=  -sin(variable.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "CosLayer"
    }
}

class SqrtLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(sqrt(variable.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        variable.gradient +=  -1 / sqrt(4 * variable.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "CosLayer"
    }
    
}

class ExpLayer: UnaryLayer  {
    override func forward() -> Variable {
        return Variable(exp(variable.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        variable.gradient +=  exp(variable.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "ExpLayer"
    }
}

class TanLayer: UnaryLayer  {
    override func forward() -> Variable {
        return Variable(tan(variable.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        variable.gradient +=  (1 / (cos(variable.value) * cos(variable.value))) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    override var description: String {
        return "TanLayer"
    }
}

class LogLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(log(variable.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        variable.gradient +=  (1 / variable.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    override var description: String {
        return "LogLayer"
    }
}


class UnaryPowLayer: UnaryLayer {
    var degree: Float
    
    init(_ variable: Variable, _ degree: Float) {
        self.degree = degree
        super.init(variable)
    }
    override func forward() -> Variable {
        return Variable(pow(variable.value, degree), self)
    }
    override func backward(with variableFromAbove: Variable) {
        variable.gradient +=  degree * pow(variable.value, degree - 1) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    override var description: String {
        return "UnaryPowLayer"
    }
}
