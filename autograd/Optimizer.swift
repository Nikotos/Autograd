//
//  Optimizer.swift
//  autograd
//
//  Created by Oak Nick on 08/03/2019.
//  Copyright © 2019 Oak Nick. All rights reserved.
//
//
// in progress
import Foundation



class Optimizer {
    var model: Module
    var dataset: Dataset
    var criterion: (Variable, Variable) -> Variable
    
    var params = [String : Float]()
    var amountOfSteps: Int
    
    init(model: Module, dataset: Dataset, criterion: @escaping (Variable, Variable) -> Variable,
         amountOfSteps: Int, learningRate: Float, regularisation: Float) {
        self.model = model
        self.dataset = dataset
        self.criterion = criterion
        self.amountOfSteps = amountOfSteps
        self.params["learningRate"] = learningRate
        self.params["reg"] = regularisation
    }
    
    private func step() {
        let (x,y) = dataset.get(at: Int.random(in: 0..<dataset.len))
        let result = model.forward(x)
        let loss = criterion(result, y)
        model.zeroGrad()
        loss.backward()
    }
    
    func run() {
        
    }
}


