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

func L1Loss(result: Variable, target: Variable) -> Variable {
    if result.value > target.value { return result - target }
    else {return target - result }
}


func L2Loss(result: Variable, target: Variable) -> Variable {
    return pow(result - target, 2)
}
