//
//  main.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

var a = Variable(1)
var b = Variable(10)
var c = Variable(15)
var d = exp(a)
d.backward()
print(a)
print(b)
print(c)

