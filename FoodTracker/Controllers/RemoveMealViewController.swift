//
//  RemoveMealViewController.swift
//  FoodTracker
//
//  Created by Diego Castaño on 13/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

class RemoveMealViewController {
    
    let controller: UIViewController
    
    // MARK: - Initializers
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    // MARK: - Methods
    
    func show(_ meal: Meal, handler: @escaping (UIAlertAction) -> Void) {
        let alert = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelButton)
        
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive, handler: handler)
        
        alert.addAction(deleteButton)
        
        controller.present(alert, animated: true)
    }
}
