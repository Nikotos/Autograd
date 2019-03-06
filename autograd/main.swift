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
var c = Variable(15)
var d = cos(a) + sin(a)
d.backward()
print(a)
print(b)

