//
//  AddItemsViewController.swift
//  FoodTracker
//
//  Created by Diego Castaño on 13/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

protocol AddItemsDelegate {
    func add(_ item: Item)
}

class AddItemsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!

    // MARK: - Attributes
    
    var delegate: AddItemsDelegate?
    
    init(delegate: AddItemsDelegate) {
        super.init(nibName: "AddItemsViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction

    @IBAction func addItem(_ sender: Any) {
        
        if let name = nameTextField.text, let calories = caloriesTextField.text {
            if let caloriesDouble = Double(calories) {
                let item = Item(name, caloriesDouble)
                delegate?.add(item)
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
}
