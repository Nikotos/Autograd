//
//  Criterions.swift
//  autograd
//
//  Created by Oak Nick on 09/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
//
//  Implementation of several Criterions
//
//

import Foundation


func L2Loss(result: Variable, target: Variable) -> Variable {
    print("hello)")
    return sqrt(pow(result, 2) + pow(target, 2))
}
