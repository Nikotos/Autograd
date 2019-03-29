//
//  main.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation



/*
let array1 = (-100...100).map {x in Float(x) / 100 + Float.random(in: -0.001...0.001) }
let array2 = (-100...100).map {x in pow(Float(x) / 100 + Float.random(in: -0.001...0.001), 2)}
var model = LearnablePolynomialModule(2)
var data = Points(array1, array2)
var optim = Optimizer(model: model, dataset: data, criterion: L2Loss,
                      amountOfSteps: 2000, learningRate: 0.1, regularisation: 0.001)


optim.run()
print(optim.stat["loss"]!)
print(model.parameters)

*/

/*
var a = Variable(2)
var b = Variable(4)
var c = Variable(8)
var d = Variable(1.01)
var u = pow(d, a * b * c)

u.backward()

print(u)
print(a)
print(b)
print(c)
print(d)

*/

var c = Matrix([2,7])
var d = Matrix([7,2])
