//
//  Layer.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation


protocol Layer {
    var leftVariable: Variable? { get set }
    var rightVariable: Variable? { get set }
    
    init(_ variableOne:Variable, _ variableTwo:Variable)
    func forward() -> Variable
    mutating func backward(with variableFromAbove:Variable)

}

extension Layer {
    func printTree() {
        print(self)
        leftVariable?.printTree()
        rightVariable?.printTree()
    }
}

class BinaryLayer: Layer, CustomStringConvertible {
    var leftVariable: Variable?
    var rightVariable: Variable?
    
    required init(_ variableOne:Variable, _ variableTwo:Variable) {
        self.leftVariable = variableOne
        self.rightVariable = variableTwo
    }
    
    func forward() -> Variable {return Variable(0)}
    
    func backward(with variableFromAbove: Variable) {}
    
    func chainableInternalBackward() {
        leftVariable!.chainableInternalBackward()
        rightVariable!.chainableInternalBackward()
    }
    
    var description: String {
        return "DefaultBinaryLayer"
    }

}

class UnaryLayer: Layer, CustomStringConvertible {
    // here we work only with left variable
    // right is just nil
    var leftVariable: Variable?
    var rightVariable: Variable?
    required init(_ variableOne:Variable, _ variableTwo:Variable) {} // just to conform protocol
    
    init(_ variable: Variable) {
        self.leftVariable = variable
    }
    
    func forward() -> Variable {return Variable(0)}
    
    func backward(with variableFromAbove: Variable) {}
    
    func chainableInternalBackward() {
        leftVariable!.chainableInternalBackward()
    }
    
    var description: String {
        return "DefaultUnaryLayer"
    }
    
}
