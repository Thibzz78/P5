//
//  AlerteHelper.swift
//  CountOnMe
//
//  Created by Thibault Bernard on 17/02/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    func erreurSimple(message: String){
        let alerte = UIAlertController(title: "Zéro !", message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerte.addAction(ok)
        present(alerte, animated: true, completion: nil)
    }
}
