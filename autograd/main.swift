//
//  main.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

var (a,b) = (Variable(1.5), Variable(1.10))
var c = Variable(1.15)


let array1 = (-100...100).map {x in Float(x) / 100 + Float.random(in: -0.001...0.001) }
let array2 = (-100...100).map {x in pow(Float(x) / 100 + Float.random(in: -0.001...0.001), 2)}
var model = LearnablePolynomialModule(2)
var data = Points(array1, array2)
var optim = Optimizer(model: model, dataset: data, criterion: L2Loss,
                      amountOfSteps: 2000, learningRate: 0.1, regularisation: 0.001)


optim.run()
print(optim.stat["loss"]!)
print(model.parameters)


