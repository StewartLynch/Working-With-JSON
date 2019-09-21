//
//  UserTableViewCell.swift
//  Working With JSON
//
//  Created by Stewart Lynch on 9/21/19.
//  Copyright © 2019 Stewart Lynch. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var favouriteNumber: UILabel!
    @IBOutlet weak var isProgrammer: UILabel!
    @IBOutlet weak var origin: UILabel!
    
    var user:User! {
        didSet {
            name.text = user.name
            favouriteNumber.text = "Favourite Number: \(user.favouriteNumber)"
            isProgrammer.text = user.isProgrammer ? "Is a programmer" : "Is NOT a programmer"
            origin.text = "Lives in \(user.origin.city), \(user.origin.country)"
        }
    }
    
}
