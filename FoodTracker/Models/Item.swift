//
//  Item.swift
//  FoodTracker
//
//  Created by Diego Castaño on 13/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    
    // MARK: Attributes
    
    let name: String
    let calories: Double
    
    // MARK: Initializers
    
    init(_ name: String, _ calories: Double) {
        self.name = name
        self.calories = calories
    }
    
    // MARK: - NSCoding
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(calories, forKey: "calories")
    }
    
    required init?(coder: NSCoder) {
        name = coder.decodeObject(forKey: "name") as! String
        calories = coder.decodeDouble(forKey: "calories")
    }
    
}
