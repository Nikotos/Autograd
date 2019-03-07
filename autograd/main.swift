//
//  main.swift
//  autograd
//
//  Created by Oak Nick on 04/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

var a = Variable(5)
var b = Variable(10)
var c = Variable(2)
var d = pow(a,c) + pow(b,c)
d.backward()

print(d)
print(a)
print(b)
print(c)


