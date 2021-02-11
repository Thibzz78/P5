//
//  Operation.swift
//  CountOnMe
//
//  Created by Thibault Bernard on 27/01/2021.
//  Copyright © 2021 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Operation {
    
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

}
