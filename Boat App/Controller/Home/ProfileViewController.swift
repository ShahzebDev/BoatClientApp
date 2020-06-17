//
//  ProfileViewController.swift
//  Boat App
//
//  Created by Moazzam Tahir on 18/06/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileImageVIew: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    let reusableIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeUI()
    }
    
    func initializeUI() {
        profileImageVIew.layer.cornerRadius = profileImageVIew.frame.height/2
    }

}
