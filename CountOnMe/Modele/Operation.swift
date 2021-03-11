//
//  Operation.swift
//  CountOnMe
//
//  Created by Thibault Bernard on 27/01/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class OperationModel {
    
    var protocole : MyProtocole?
    
    var calculText : String = ""
    
    var elements: [String] {
        return calculText.split(separator: " ").map { "\($0)" }
    }

    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "*"
    }

    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "/" && elements.last != "*"
    }

    var expressionHaveResult: Bool {
        return calculText.firstIndex(of: "=") != nil
    }
    
    var expressionNotDivisionZero: Bool {
        return calculText.contains(" / 0")
    }
    
    func reset(){
        calculText = ""
        protocole?.getResult(result: calculText)
    }

    // récupération du chiffre
    func getNumber(numberText : String){
        if expressionHaveResult{
            calculText = ""
        }
        calculText.append(numberText)
        protocole?.getResult(result: calculText)
    }
    
    // récupération de l'opérateur
    func getOperator(operatorr : String){
        if canAddOperator{
            calculText.append(operatorr)
        }
        else{
            protocole?.showAlert(message: "un operateur est déjà mis !")
        }
        protocole?.getResult(result: calculText)
    }
    
    func getResult(){
        guard expressionIsCorrect else {
            protocole?.showAlert(message: "Entrez une expression correcte !")
            return
        }
        print(elements.count)
        guard expressionHaveEnoughElement else {
            protocole?.showAlert(message: "Entrez une expression correcte !")
            return
        }
        guard !expressionNotDivisionZero else {
            protocole?.showAlert(message: "Entrez une expression correct !")
            return
        }
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        func priorityCalcul(list : [String]) -> Bool{
            return list.contains("/") || list.contains("*")
        }
        
        // Iterate over operations while an operand still here
        var i = 0
        while operationsToReduce.count > 1 {
            let left = Double(operationsToReduce[i])!
            let operand = operationsToReduce[i+1]
            let right = Double(operationsToReduce[i+2])!
        
            
            if priorityCalcul(list: operationsToReduce){
                if operand != "/" && operand != "*"{
                    i += 2
                    continue
                }
            }
            
            let result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right
            case "*": result = left * right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce.remove(at: i)
            operationsToReduce.remove(at: i)
            operationsToReduce.remove(at: i)
            operationsToReduce.insert("\(result)", at: i)
                                     
            i = 0
        }
        calculText.append(" = \(operationsToReduce[i])")
        protocole?.getResult(result: calculText.replacingOccurrences(of: ".0", with: ""))
    }
}
