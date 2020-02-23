//
//  Travel.swift
//  Travel
//
//  Created by Diego Castaño on 17/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

class TravelDAO: NSObject {
    
    // MARK: - Attributes
    
    let travels: Array<Travel> = [
        Travel(title: "Ceará", days: 3, price: "1.000,59", image: "img1.png"),
        Travel(title: "Rio de Janeiro", days: 6, price: "1.200,00", image: "img2.jpg"),
        Travel(title: "Atibaia - São Paulo", days: 1, price: "890,00", image: "img3.jpg"),
        Travel(title: "Paraíba", days: 4, price: "1.385,00", image: "img4.jpg"),
        Travel(title: "Fortaleza", days: 4, price: "3.120,00", image: "img5.jpg")
    ]
    
    // MARK: - Methods
    
    func list() -> Array<Travel> {
        return travels
    }
    
}
