//
//  main.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

var a = Variable(1.1)
var b = Variable(10)
var c = Variable(2)
var model = LearnablePolynomialModule(a, 10)
var d = model.forward()
d.backward()


print(a)


