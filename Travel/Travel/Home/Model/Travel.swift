//
//  Travel.swift
//  Travel
//
//  Created by Diego Castaño on 17/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import Foundation

class Travel {
    
    // MARK: - Attributes
    
    let title: String
    let days: Int
    let price: String
    let image: String
    
    // MARK: - Initializers
    
    init(title: String, days: Int, price: String, image: String) {
        self.title = title
        self.days = days
        self.price = price
        self.image = image
    }
    
}
