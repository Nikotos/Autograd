//
//  VariablesMethodsOverload.swift
//  autograd
//
//  Created by Oak Nick on 06/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation


func +(left: Variable, right: Variable) -> Variable {
    let parentLayer = PlusLayer(left, right)
    return parentLayer.forward()
}

func -(left: Variable, right: Variable) -> Variable {
    let parentLayer = MinusLayer(left, right)
    return parentLayer.forward()
}

func *(left: Variable, right: Variable) -> Variable {
    let parentLayer = MulLayer(left, right)
    return parentLayer.forward()
}

func /(left: Variable, right: Variable) -> Variable {
    let parentLayer = DivLayer(left,right)
    return parentLayer.forward()
}

func sin(_ variable: Variable) -> Variable {
    let parentLayer = SinLayer(variable)
    return parentLayer.forward()
}


func cos(_ variable: Variable) -> Variable {
    let parentLayer = CosLayer(variable)
    return parentLayer.forward()
}


func sqrt(_ variable: Variable) -> Variable {
    let parentLayer = SqrtLayer(variable)
    return parentLayer.forward()
}

func exp(_ variable: Variable) -> Variable{
    let parentLayer = ExpLayer(variable)
    return parentLayer.forward()
}
