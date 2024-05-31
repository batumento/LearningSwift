//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray : [ItemData] = [ItemData]()
    var defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = ItemData()
        newItem.title = "Deneme"
        itemArray.append(newItem)

        let newItem2 = ItemData()
        newItem2.title = "Example"
        itemArray.append(newItem2)

        let newItem3 = ItemData()
        newItem3.title = "Food"
        itemArray.append(newItem3)

        if let items = defaults.array(forKey: "ToDoListArray") as? [ItemData]
        {
            itemArray = items
        }
    }
        //MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }

        //MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

        //MARK: - Add Item Section
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Todoey Item", message: "", preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "Add Item", style: .default) { action in
            let newItem = ItemData()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        alert.addAction(alertAction)
        present(alert, animated: true)
    }
}

