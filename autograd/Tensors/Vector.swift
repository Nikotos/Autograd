//
//  Tensor.swift
//  autograd
//
//  Created by Oak Nick on 26/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
// Version 0.0 - Vanilla
// Tensors is made by arrays of Variales
// In other wirds - computational graph still have "Variables" in its nodes
// Its not really efficient, but it is quite simple to implement 


import Foundation

class Vector {
    var data = [Variable]()
    var count: Int {
        return data.count
    }
    var shape: [Int] {
        return [data.count]
    }
    init(_ shape: [Int]) {
        assert(shape.count == 1, "Invalid shape for one-dimensional Vector")
        self.data = (0..<shape.first!).map {_ in Variable.random(in: -0.01...0.01)}
    }
    init (_ data: [Variable]) {
        self.data = data
    }
    
    subscript(index: Int) -> Variable {
        get {
            assert(index < count, "Index out of range")
            return data[index]
        }
        set(newValue) {
            assert(index < count, "Index out of range")
            data[index] = newValue
        }
    }
}

extension Vector: CustomStringConvertible {
    var description: String {
        var res = String()
        for x in data {
            res += String(x.value) + " "
        }
        res += "\n"
        return res
    }
    /*
     Created with the aim of allowing writing simople math operations
     much simplier
     */
    static private func performElementwise(_ left: Vector, _ right: Vector,
                                           _ function: (Variable, Variable) -> Variable) -> Vector {
        assert(left.count == right.count)
        var result = [Variable]()
        result.reserveCapacity(left.count)  // with the aim of performance
        for i in 0..<left.count {result.append(function(left.data[i], right.data[i]))}
        return Vector(result)
    }
    static func + (_ left: Vector, _ right: Vector) -> Vector {
        return self.performElementwise(left, right, {$0 + $1})
    }
    static func - (_ left: Vector, _ right: Vector) -> Vector {
        return self.performElementwise(left, right, {$0 - $1})
    }
    static func *(_ left: Vector, _ right: Vector) -> Variable {
        assert(left.count == right.count)
        return self.performElementwise(left, right, {$0 * $1}).data.reduce(Variable(0)) {$0 + $1}
    }
}
