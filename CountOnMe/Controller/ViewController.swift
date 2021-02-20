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
    
    func showAlert(message: String) {
        erreurSimple(message: message)
    }
    
    var calcul = Operation()
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        calcul.getNumber(numberText: numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        calcul.getOperator(operatorr: "+")
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        calcul.getOperator(operatorr: "-")
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        calcul.getOperator(operatorr: "/")
    }
    
    @IBAction func tappedMultiplierButton(_ sender: UIButton) {
        calcul.getOperator(operatorr: "*")
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        calcul.getResult()
    }

}
