//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray : [String] = ["Sabah erken kalk", "Duş al", "Su iç"]
    var defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = defaults.object(forKey: "ToDoListArray") as? [String]
        {
            itemArray = item
        }
    }

    func toggleCellAccessory(_ tableCell: UITableViewCell)
    {
        if tableCell.accessoryType == .checkmark
        {
            tableCell.accessoryType = .none
        }
        else
        {
            tableCell.accessoryType = .checkmark
        }
    }

        //MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItem", for: indexPath)
        if #available(iOS 14.0, *)
        {
            var content = cell.defaultContentConfiguration()
            content.text = itemArray[indexPath.row]
        }
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }

        //MARK: - TableView Delegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        toggleCellAccessory(tableView.cellForRow(at: indexPath)!)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
        //MARK: - Add Item Section
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add Todoey Item", message: "", preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "Add Item", style: .default) { action in
            self.itemArray.append(textField.text!)
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

