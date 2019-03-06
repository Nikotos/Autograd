//
//  LayersImplementation.swift
//  autograd
//
//  Created by Oak Nick on 06/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

class PlusLayer: BinaryLayer  {
    override func forward() -> Variable {
        return Variable(leftVariable!.value + rightVariable!.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient += 1 * variableFromAbove.gradient
        rightVariable!.gradient += 1 * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    override var description: String {
        return "PlusLayer"
    }
}

class MinusLayer: BinaryLayer {
    override func forward() -> Variable {
        return Variable(leftVariable!.value - rightVariable!.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient += 1 * variableFromAbove.gradient
        rightVariable!.gradient += 1 * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "MinusLayer"
    }
}


class MulLayer: BinaryLayer {
    
    override func forward() -> Variable {
        return Variable(leftVariable!.value * rightVariable!.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  rightVariable!.value * variableFromAbove.gradient
        rightVariable!.gradient += leftVariable!.value * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "MulLayer"
    }
}


class DivLayer: BinaryLayer {
    override func forward() -> Variable {
        return Variable(leftVariable!.value / rightVariable!.value, self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  (1 / rightVariable!.value) * variableFromAbove.gradient
        rightVariable!.gradient += -(1 / (rightVariable!.value * rightVariable!.value)) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "MulLayer"
    }
}

class SinLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(sin(leftVariable!.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  cos(leftVariable!.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "SinLayer"
    }
}

class CosLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(cos(leftVariable!.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  -sin(leftVariable!.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "CosLayer"
    }
}

class SqrtLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(sqrt(leftVariable!.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  -1 / sqrt(4 * leftVariable!.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "CosLayer"
    }
    
}

class ExpLayer: UnaryLayer  {
    override func forward() -> Variable {
        return Variable(exp(leftVariable!.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  exp(leftVariable!.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    
    override var description: String {
        return "ExpLayer"
    }
}

class TanLayer: UnaryLayer  {
    override func forward() -> Variable {
        return Variable(tan(leftVariable!.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  (1 / (cos(leftVariable!.value) * cos(leftVariable!.value))) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    override var description: String {
        return "TanLayer"
    }
}

class LogLayer: UnaryLayer {
    override func forward() -> Variable {
        return Variable(log(leftVariable!.value), self)
    }
    
    override func backward(with variableFromAbove: Variable) {
        leftVariable!.gradient +=  (1 / leftVariable!.value) * variableFromAbove.gradient
        super.chainableInternalBackward()
    }
    override var description: String {
        return "TanLayer"
    }
}
