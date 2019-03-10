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
    func defaultUpdateWeights(with learningRate: Float)
}


class LearnablePolynomialModule: Module, CustomStringConvertible {
    var parameters: [Variable]
    
    init(_ degree: Int) {
        parameters = (0...degree).map {i in Variable(Float.random(in: -0.5...0.5))}
    }
    
    func forward(_ variable: Variable) -> Variable {
        let degree = parameters.count - 1
        var result = Variable(0)
        for i in 0...degree {
            result = result + parameters[i] * pow(variable, i)
        }
        return result
    }
    
    func defaultUpdateWeights(with learningRate: Float) {
        self.parameters.forEach {$0.value -= $0.gradient * learningRate}
    }
    
    func zeroGrad() {
        self.parameters.forEach {$0.zeroGrad()}
    }
    
    var description: String {
        return "LearnablePolynomialModule"
    }
}

