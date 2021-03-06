//
//  VariablesMethodsOverload.swift
//  autograd
//
//  Created by Oak Nick on 06/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
//  Operators overloading for Variable Type


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

func pow(_ left: Variable, _ right: Variable) -> Variable {
    let parentLayer = PowLayer(left, right)
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

func exp(_ variable: Variable) -> Variable {
    let parentLayer = ExpLayer(variable)
    return parentLayer.forward()
}

func tan(_ variable: Variable) -> Variable {
    let parentLayer = TanLayer(variable)
    return parentLayer.forward()
}

func log(_ variable: Variable) -> Variable {
    let parentLayer = LogLayer(variable)
    return parentLayer.forward()
}

func pow(_ variable: Variable, _ degree: Float) -> Variable {
    let parentLayer = UnaryPowLayer(variable, degree)
    return parentLayer.forward()
}

func pow(_ variable: Variable, _ degree: Int) -> Variable {
    let parentLayer = UnaryPowLayer(variable, Float(degree))
    return parentLayer.forward()
}
