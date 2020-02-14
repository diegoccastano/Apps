//
//  ViewController.swift
//  FoodTracker
//
//  Created by Diego Castaño on 13/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

protocol AddMealDelegate {
    func add(_ meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemsDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itemsTableView: UITableView?
    
    // MARK: - Attributes
    
    var delegate: AddMealDelegate?
    var items: Array<Item> = []
    var selectedItems: Array<Item> = []
    
    // MARK: - Methods
    
    func retriveMeal() -> Meal? {
        guard let name = nameTextField?.text else { return nil }
        
        guard let happinessText = happinessTextField?.text,
              let happiness = Int(happinessText) else { return nil }
        
        let meal = Meal(name: name, happiness: happiness, items: selectedItems)
        
        return meal
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var happinessTextField: UITextField?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        let buttonAddItem = UIBarButtonItem(title: "Add Item", style: .plain, target: self, action: #selector(addItem))
        navigationItem.rightBarButtonItem = buttonAddItem
        unarchiveItems()
    }
    
    func unarchiveItems() {
        if let content = ArchiveUtils("items").load() as? Array<Item> {
            items = content
        }
    }
    
    @objc func addItem() {
        let addItemsViewController = AddItemsViewController(delegate: self)
        navigationController?.pushViewController(addItemsViewController, animated: true)
    }
    
    func add(_ item: Item) {
        items.append(item)
        if let tableView = itemsTableView {
            tableView.reloadData()
        } else {
            Alert(controller: self, title: "Sorry", message: "Unable to update table.").show()
        }
        
        ArchiveUtils("items").save(items)
    }
    
    // MARK: - IBActions
    
    @IBAction func add(_ sender: Any) {
        if let meal = retriveMeal() {
            delegate?.add(meal)
            navigationController?.popViewController(animated: true)
        } else {
            Alert(controller: self, message: "Error on retrive from form.").show()
        }
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
 
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            selectedItems.append(items[indexPath.row])
        } else {
            cell.accessoryType = .none
            if let text = cell.textLabel?.text,
               let index = selectedItems.firstIndex(where: { $0.name == text}) {
                    selectedItems.remove(at: index)
            } else {
                print("Error removing selected item from array.")
            }
        }
    }
    
}

