//
//  ViewController.swift
//  Boat App
//
//  Created by Moazzam Tahir on 31/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createAccount(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = story.instantiateViewController(identifier: "SignupScreen")
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func signIn(_ sender: Any) {
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = story.instantiateViewController(identifier: "LoginScreen")
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func openTermsConditions(_ sender: Any) {
    }
}  


