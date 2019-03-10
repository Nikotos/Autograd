//
//  LearnableLayers.swift
//  autograd
//
//  Created by Oak Nick on 08/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

protocol Module {
    func forward(_ variable: Variable) -> Variable
    func zeroGrad()
}


class LearnablePolynomialModule: Module, CustomStringConvertible {
    var parameters: [Variable]
    
    init(_ variable: Variable, _ degree: Int) {
        parameters = (0...degree + 1).map {i in Variable(Float.random(in: -1...1))}
    }
    
    func forward(_ variable: Variable) -> Variable {
        let degree = parameters.count - 1
        var result = Variable(0)
        for i in 0...degree {
            result = result + parameters[i] * pow(variable, Float(i))
        }
        return result
    }
    
    func vanilaUpdateWeights(with learningRate: Float) {
        self.parameters.forEach {$0.value -= $0.gradient * learningRate}
    }
    
    func zeroGrad() {
        self.parameters.forEach {$0.zeroGrad()}
    }
    
    var description: String {
        return "LearnablePolynomialModule"
    }
}

