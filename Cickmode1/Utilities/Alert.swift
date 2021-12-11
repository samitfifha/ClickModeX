//
//  Alert.swift
//  Cickmode1
//
//  Created by Mac2021 on 11/12/2021.
//  Copyright © 2021 macbook. All rights reserved.
//
import Foundation
import UIKit

public class Alert {
    static func makeAlert(titre: String?, message: String?) -> UIAlertController {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        return alert
    }
    
        static func makeActionAlert(titre: String?, message: String?, action: UIAlertAction) -> UIAlertController {
        let alert = UIAlertController(title: titre, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Annuler", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        alert.addAction(action)
        return(alert)
    }
}
