//
//  LearnableLayers.swift
//  autograd
//
//  Created by Oak Nick on 08/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

protocol Module {
    func forward() -> Variable
}


class LearnablePolynomialModule: Module, CustomStringConvertible {
    var variable: Variable
    var parameters: [Variable]
    
    init(_ variable: Variable, _ degree: Int) {
        self.variable = variable
        parameters = (0...degree + 1).map {i in Variable(Float.random(in: -1...1))}
    }
    
    func forward() -> Variable {
        let degree = parameters.count - 1
        var result = Variable(0)
        for i in 0...degree {
            result = result + parameters[i] * pow(variable, Float(i))
        }
        return result
    }
    
    var description: String {
        return "LearnablePolynomialModule"
    }
}

