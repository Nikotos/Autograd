//
//  Matrix.swift
//  autograd
//
//  Created by Oak Nick on 29/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

class Matrix {
    var data = [Vector]()
    var count: Int {
        return data.count
    }
    var shape: [Int] {
        return [data.count, data.first!.count]
    }
    
    var shapeIsValid: Bool {
        for i in 0..<self.shape.count {
            if shape[i] < 0 || shape[i] > self.shape[i] { return false }
        }
        return true
    }
    
    init(_ shape: [Int]) {
        assert(shape.count == 2, "Invalid shape for two-dimensional Matrix")
        self.data = Array(repeating: Vector([shape.last!]), count: shape.first!)
    }
    init(_ data: [Vector]) {
        self.data = data
    }
    
    subscript(shape: Int...) -> Variable {
        get {
            assert(shapeIsValid, "Index out of range!")
            return data[shape[0]].data[shape[1]]
        }
        set(newValue) {
            assert(shapeIsValid, "Index out of range!")
            data[shape[0]].data[shape[1]] = newValue
        }
    }

    
}


extension Matrix: CustomStringConvertible {
    var description: String {
        var res = String()
        for x in self.data {
            res += x.description
        }
        return res
    }
    
    static func haveSameShapes(_ left: Matrix, _ right: Matrix) -> Bool {
        for i in 0..<left.shape.count {
            if left.shape[i] != right.shape[i] { return false }
        }
        return true
    }
    
    static func shapedForMul(_ left: Matrix, _ right: Matrix) -> Bool {
        return left.shape[1] == right.shape[0]
    }
    
    static private func performElementwise(_ left: Matrix, _ right: Matrix,
                                           _ function: (Vector, Vector) -> Vector) -> Matrix {
        var result = [Vector]()
        result.reserveCapacity(left.count)  // with the aim of performance
        for i in 0..<left.count { result.append(function(left.data[i], right.data[i]))}
        return Matrix(result)
    }
    
    public func transposed() -> Matrix {
        var newData = [Vector]()
        newData.reserveCapacity(self.shape[1])
        for i in 0..<self.shape[1] {
            var vec = [Variable]()
            for j in  0..<self.shape[0] {
                vec.append(data[j].data[i])
            }
            newData.append(Vector(vec))
        }
        return Matrix(newData)
    }
    
    static func + (_ left: Matrix, right: Matrix) -> Matrix {
        assert(haveSameShapes(left, right), "Different shaped matrixes!")
        return self.performElementwise(left, right, {$0 + $1})
    }
    
    static func - (_ left: Matrix, right: Matrix) -> Matrix {
        assert(haveSameShapes(left, right), "Different shaped matrixes!")
        return self.performElementwise(left, right, {$0 - $1})
    }
    
    //
    //  Here I use transpose to apply scalar multiplication,
    //  which I've written in Vector
    //
    static func *(_ left: Matrix, right: Matrix) -> Matrix {
        assert(shapedForMul(left, right), "Not Appropriate shapes for Multiplicating!")
        let rightT = right.transposed()
        let result = Matrix([left.shape[0], right.shape[1]])
        for i in 0..<left.shape[0] {
            for j in 0..<right.shape[1] {
                result[i,j] = left.data[i] * rightT.data[j]
            }
        }
        return result
    }
    
    static func * (_ left: Vector, _ right: Matrix) -> Matrix {
        return Matrix([left]) * right
    }
    static func * (_ left: Matrix, _ right: Vector) -> Matrix {
        return left * Matrix([right]).transposed()
    }
    
}
