//
//  Optimizer.swift
//  autograd
//
//  Created by Oak Nick on 08/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
//
// Optimization of our model based on dataset 



import Foundation



class Optimizer {
    var model: Module
    var dataset: Dataset
    var criterion: (Variable, Variable) -> Variable
    
    var params = [String : Float]()
    var amountOfSteps: Int
    
    var stat = [String: [Float]]()
    
    init(model: Module, dataset: Dataset, criterion: @escaping (Variable, Variable) -> Variable,
         amountOfSteps: Int, learningRate: Float, regularisation: Float) {
        self.model = model
        self.dataset = dataset
        self.criterion = criterion
        self.amountOfSteps = amountOfSteps
        self.params["lr"] = learningRate
        self.params["reg"] = regularisation
        
        self.stat["loss"] = [Float]()
    }
    
    private func step() -> Float {
        var loss = Variable(0.0)
        for _ in 0...10 {
            let (x,y) = dataset.get(at: Int.random(in: 0..<dataset.len))
            let result = model.forward(x)
            loss = loss + criterion(result, y)
        }
        loss = loss / Variable(10)
        model.zeroGrad()
        loss.backward()
        model.defaultUpdateWeights(with: self.params["lr"]!)
        return loss.value
    }
    
    func run() {
        for _ in 0..<self.amountOfSteps {
            let loss = step()
            stat["loss"]?.append(loss)
        }
    }
}


