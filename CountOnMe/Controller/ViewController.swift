//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MyProtocole {
    
    func getResult(result: String) {
        textView.text = result
    }
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var calcul = Operation()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calcul.getNumber(numberText: numberText)
        textView.text.append(numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if calcul.getOperator(operatorr: " + ") == true{
            textView.text.append(" + ")
        }else {
            AlerteHelper().erreurSimple(self, message: "un operateur est déjà mis !")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if calcul.getOperator(operatorr: " - ") == true {
            textView.text.append(" - ")
        } else {
            erreurSimple(message: "un operateur est déjà mis !")
        }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if calcul.getOperator(operatorr: " / ") == true {
            textView.text.append(" / ")
        } else {
            erreurSimple(message: "un operateur est déjà mis !")
        }
    }
    
    @IBAction func tappedMultiplierButton(_ sender: UIButton) {
        if calcul.getOperator(operatorr: " * ") == true {
            textView.text.append(" * ")
        } else {
            erreurSimple(message: "un operateur est déjà mis !")
        }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard calcul.expressionIsCorrect else {
            
            
            erreurSimple(message: "Entrez une expression correcte !")
            
            
            
            let alertVC = UIAlertController(title: "Zéro!", message: "Entrez une expression correcte !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }
        
        guard calcul.expressionHaveEnoughElement else {
            
            
            AlerteHelper().erreurSimple(self, message: "Entrez une expression correcte !")
            return
            
/*            let alertVC = UIAlertController(title: "Zéro!", message: "Démarrez un nouveau calcul !", preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil) */
        }
        
        // Create local copy of operations
        var operationsToReduce = calcul.elements
        
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
        
        textView.text.append(" = \(operationsToReduce.first!)")
    }

}
