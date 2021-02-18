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

    
    func getNumber(numberText : String){
        if expressionHaveResult{
            calculText = ""
        }
        calculText.append(numberText)
    }
    
    func getOperator(operatorr : String) -> Bool{
        if canAddOperator{
            calculText.append(operatorr)
            return true
        }
        return false
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





// PAS DE LOGIQUE SUR LE VIEWCONTROLLER (RECUPERE LES ACTIONS DU STORYBOARD ET RENVOIE AU MODELE ET LE MODELE S'OCCUPE DE LA LOGIQUE ET RENVOIE LE RESULTAT AU CONTROLLER ET LE CONTROLLER L'AFFICHE AU STORYBOARD)

// LE CONTROLLER NE FAIT PAS DE LOGIQUE !!!!!
