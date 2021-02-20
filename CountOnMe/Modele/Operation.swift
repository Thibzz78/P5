//
//  Operation.swift
//  CountOnMe
//
//  Created by Thibault Bernard on 27/01/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Operation {
    
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
        
        guard expressionHaveEnoughElement else {
            protocole?.showAlert(message: "Entrez une expression correcte !")
            return
        }
        
        // Create local copy of operations
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Double(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Double(operationsToReduce[2])!
            
            let result: Double
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "/": result = left / right
            case "*": result = left * right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }
        protocole?.getResult(result: calculText)
    }
}

// fonction qui recupere le nombre sur lequel on a cliqué.
// parametre : String --> IBAction
/* func getNumber(numberText : String){
 
 recupere le nombre et je l'ajoute a la chaine de String.
 (Tableau de string)
 }
 
 dans la func
 tappedNumberButton(){
 
 calcul.getNumber(numberText)
 
 }

*/






// fonction qui recupere l'opérateur sur lequel on a cliqué.
/* func getOperator(operator : String){}
 
 dans la func
 tappedAdditionButton,
 tappedSubstractionButton,
 tappedMultiplierButton,
 tappedDivisionButton(){
 
 calcul.getOperator(operator){
 check condition
 ajout de l'opérateur a la chaine de String
 }

*/






/* fonction calcul appellé quand on clique sur égal.

 tappedEqualButton(){
 
 calcul.getEqual()
 }
 
 
 func getEqual(){
 ordre de priorité
 calcul de la somme
 protocole.getResult(result)
 }
 
 */




/*
 Nouveau fichier MyProtocole
 
 
 
 crée un protocole (myResult)
 
 déclarer une fonction (getResult)
 
 getResult(Result : String)
 
 */
