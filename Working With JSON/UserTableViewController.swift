//
//  UserTableViewController.swift
//  Working With JSON
//
//  Created by Stewart Lynch on 9/21/19.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import UIKit

class UserTableViewController: UITableViewController {
    var users:[User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = DataSource.loadSeedData([User].self, from: "SeedData.json")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserTableViewCell
        cell.user = users[indexPath.row]
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? FamilyTableViewController else {return}
        let selectedRow = tableView.indexPathForSelectedRow?.row
        let user = users[selectedRow!]
        vc.user = user
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showFamily", sender: nil)
    }
    
    @IBAction func addUsers(_ sender: Any) {
        let alert = UIAlertController(title: "New User", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Name"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Favourite Number"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "City"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Country"
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let name = alert?.textFields![0].text
            let favNumber = Int((alert?.textFields![1].text)!)
            let city = alert?.textFields![2].text
            let country = alert?.textFields![3].text
            let newUser = User(name: name ?? "No name",
                               favouriteNumber: favNumber ?? 0,
                               isProgrammer: false,
                               origin: Origin(city: city ?? "No City", country: country ?? "No Country"),
                               family: [])
            self.users.append(newUser)
            self.tableView.reloadData()
        }))
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func createJSON(_ sender: Any) {
        let JSONString = DataSource.createNewJSON(from: users)
        print(JSONString)
    }
}
