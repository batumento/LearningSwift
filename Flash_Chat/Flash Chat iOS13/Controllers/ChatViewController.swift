//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!

    let db = Firestore.firestore()

    var messages: [Message] =
    [
        Message(sender: "1@2.com", body: "Heey!"),
        Message(sender: "a@b.com", body: "Hi")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }

    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let user = Auth.auth().currentUser?.email
        {
            messages.append(Message(sender: user, body: messageBody))
            tableView.reloadData()
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField : user,
                K.FStore.bodyField : messageBody,
            ]) { error in
                if let e = error
                {
                    print("There was an issue saving data to firestore, \(e)")
                }
                else
                {
                    print("Successfully saved data.")
                }
            }
            messageTextfield.text = ""
        }
    }

    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do
        {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch let signOutError as NSError
        {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        /*if #available(iOS 14.0, *)
        {
            var config = cell.defaultContentConfiguration()
            config.text = messages[indexPath.row].body
            cell.contentConfiguration = config
        }*/
        cell.label.text = messages[indexPath.row].body
        return cell
    }
}
