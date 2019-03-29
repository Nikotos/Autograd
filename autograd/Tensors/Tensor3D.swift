//
//  Tensor3.swift
//  autograd
//
//  Created by Oak Nick on 29/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//

import Foundation

class Tensor3D {
    var data = [Matrix]()
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
        assert(shape.count == 3, "Invalid shape for three-dimensional Tensor")
        self.data = Array(repeating: Matrix([shape[1], shape[2]]), count: shape[0])
    }
    init(_ data: [Matrix]) {
        self.data = data
    }
    
    subscript(shape: Int...) -> Variable {
        get {
            assert(shapeIsValid, "Index out of range!")
            return data[shape[0]].data[shape[1]].data[shape[2]]
        }
        set(newValue) {
            assert(shapeIsValid, "Index out of range!")
            data[shape[0]].data[shape[1]].data[shape[2]] = newValue
        }
    }
}

extension Tensor3D: CustomStringConvertible {
    var description: String {
        var res = String()
        for x in data {
            res += x.description + " "
        }
        res += "\n"
        return res
    }
    /*
     Created with the aim of allowing writing simople math operations
     much simplier
     */
    static private func performElementwise(_ left: Tensor3D, _ right: Tensor3D,
                                           _ function: (Matrix, Matrix) -> Matrix) -> Tensor3D {
        assert(left.count == right.count)
        var result = [Matrix]()
        result.reserveCapacity(left.count) 
        for i in 0..<left.count {result.append(function(left.data[i], right.data[i]))}
        return Tensor3D(result)
    }
    static func + (_ left: Tensor3D, _ right: Tensor3D) -> Tensor3D {
        return self.performElementwise(left, right, {$0 + $1})
    }
    static func - (_ left: Tensor3D, _ right: Tensor3D) -> Tensor3D {
        return self.performElementwise(left, right, {$0 - $1})
    }
    //
    //  Scalar multiplication
    //
    /*
    static func *(_ left: Tensor3D, _ right: Tensor3D) -> Variable {
        assert(left.count == right.count)
        return self.performElementwise(left, right, {$0 * $1}).data.reduce(Variable(0)) {$0 + $1}
    }
 */
}
