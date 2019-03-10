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

var u = pow(a,2) + pow(b,2) + pow(c,2)
u = sqrt(u) + cos(a * b * c)
u = u + exp(u)


/*
var model = LearnablePolynomialModule(a, 10)
var data = Points([1.0, 2.0], [1.0, 4.0])
var optim = Optimizer(model: model, dataset: data, criterion: L2Loss,
                      amountOfSteps: 10, learningRate: 1.1, regularisation: 0.001)

*/
u.backward()
print(a)
print(b)
print(c)

