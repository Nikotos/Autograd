//
//  Dataset.swift
//  autograd
//
//  Created by Oak Nick on 09/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
//  Dataset implementation to provide learning module (i mean optimizer) with data
//

import Foundation


protocol Dataset {
    func get(at index: Int) -> (Variable, Variable)
    var len: Int { get }
}

class Points: Dataset {
    var dataX = [Variable]()
    var dataY = [Variable]()
    
    init(_ dataX: [Float], _ dataY: [Float]) {
        guard dataX.count == dataY.count else {
            print("Shapes doesnt match")
            return
        }
        self.dataX = dataX.map {Variable($0)}
        self.dataY = dataY.map {Variable($0)}
    }
    
    func get(at index: Int) -> (Variable, Variable) {
        let (x, y) = (dataX[index], dataY[index])
        // we need to do so, because get provides references to dataX and dataY samples
        // That's why every optimization step cause non-zero gradient in our data
        // Thst's why we need to call "zeroGrad" before providing a sample
        x.zeroGrad()
        y.zeroGrad()
        return (x, y)
    }
    
    var len: Int {
        return dataX.count
    }
}

