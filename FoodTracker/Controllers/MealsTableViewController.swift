//
//  MealsTableViewController.swift
//  FoodTracker
//
//  Created by Diego Castaño on 13/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    
    // MARK: - Attributes
    
    var meals: Array<Meal> = []
    
    // MARK: - Methods
    
    func add(_ meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
        ArchiveUtils("meals").save(meals)
    }
    
    func unarchiveMeals() {
        if let content = ArchiveUtils("meals").load() as? Array<Meal> {
            self.meals = content
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        unarchiveMeals()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let meal = meals[indexPath.row]
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    @objc func showDetails(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let cell = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let meal = meals[indexPath.row]
            
            RemoveMealViewController(controller: self).show(meal, handler: { alert in
                self.meals.remove(at: indexPath.row)
                self.tableView.reloadData()
            })
        }
    }
    
}
