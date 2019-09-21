//
//  FamilyTableViewController.swift
//  Working With JSON
//
//  Created by Stewart Lynch on 9/21/19.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import UIKit

class FamilyTableViewController: UITableViewController {
    var user:User!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return user.family.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let familyMember = user.family[indexPath.row]
        cell.textLabel!.text = familyMember.name
        cell.detailTextLabel!.text = "Age: \(familyMember.age)"

        return cell
    }


    @IBAction func addFamily(_ sender: Any) {
        let alert = UIAlertController(title: "New Family Member", message: "", preferredStyle: .alert)
         alert.addTextField { (textField) in
               textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
               textField.placeholder = "Age"
        }
        
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let name = alert?.textFields![0].text
            let age = Int((alert?.textFields![1].text)!)
            self.user.newFamilyMember(name: name ?? "No name", age: age ?? 0)
            self.tableView.reloadData()
           }))

           self.present(alert, animated: true, completion: nil)
    }
    

}
