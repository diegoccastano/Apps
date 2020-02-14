//
//  Meal.swift
//  FoodTracker
//
//  Created by Diego Castaño on 13/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCoding {
    
    // MARK: Attributes
    
    let name: String
    let happiness: Int
    let items: Array<Item>
    
    // MARK: Initializers
    
    init(name: String, happiness: Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(happiness, forKey: "happiness")
        coder.encode(items, forKey: "items")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        happiness = coder.decodeInteger(forKey: "happiness")
        items = coder.decodeObject(forKey: "items") as! Array<Item>
    }
    
    // MARK: Methods
    
    func totalCalories() -> Double {
        var total = 0.0
        for item in items {
            total += item.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "\nHappiness: \(self.happiness)\n Calories: \(self.totalCalories())\n"
        for item in self.items {
            message += "\n \(item.name): \(item.calories) cal"
        }
        return message
    }
    
}
