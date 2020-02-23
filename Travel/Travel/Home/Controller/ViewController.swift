//
//  ViewController.swift
//  Travel
//
//  Created by Diego Castaño on 17/02/20.
//  Copyright © 2020 @diegoccastano. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewTravel: UITableView!
    @IBOutlet weak var viewButtonHotels: UIView!
    @IBOutlet weak var viewButtonPackages: UIView!
    
    // MARK: Attributes
    
    let travels = TravelDAO().list()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewTravel.dataSource = self
        self.tableViewTravel.delegate = self
        self.viewButtonHotels.layer.cornerRadius  = 10
        self.viewButtonPackages.layer.cornerRadius = 10
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let travel = travels[indexPath.row]
        
        cell.labelTitle.text = travel.title
        cell.pictureView.image = UIImage(named: travel.image)
        cell.labelDays.text = "\(travel.days) days"
        cell.labelValue.text = travel.price
        
        cell.pictureView.layer.cornerRadius = 10
        cell.pictureView.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 260 : 175
    }
}

