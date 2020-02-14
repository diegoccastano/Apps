//
//  Alert.swift
//  FoodTracker
//
//  Created by Diego Castaño on 13/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

class Alert {
    
    // MARK: - Attributes
    
    let controller: UIViewController
    let title: String
    let message: String
    
    // MARK: - Initializers
    
    init(controller: UIViewController, title: String = "Error", message: String = "Action not performed.") {
        self.controller = controller
        self.title = title
        self.message = message
    }
    
    // MARK: - Methods
    
    func show() {
        let alert = UIAlertController(title: self.title, message: self.message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        self.controller.present(alert, animated: true, completion: nil)
    }
}
