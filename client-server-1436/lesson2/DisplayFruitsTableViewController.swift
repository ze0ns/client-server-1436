//
//  DisplayFruitsTableViewController.swift
//  client-server-1436
//
//  Created by zeons on 15.08.2021.
//

import UIKit

protocol DisplayFruitsTableViewControllerDelegate: AnyObject {
    func fruitDidSelect(fruit: String)
}

class DisplayFruitsTableViewController: UITableViewController {
    let fruits = ["Авокадо","Банан","Яблоко","Киви"]
   
    weak var delegate: DisplayFruitsTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fruits.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = fruits[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let fruit = fruits[indexPath.row]
        delegate?.fruitDidSelect(fruit: fruit)
        navigationController?.popViewController(animated: true)
           
       }


}
