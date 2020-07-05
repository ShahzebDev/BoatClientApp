//
//  UserAlerts.swift
//  Boat App
//
//  Created by shahzeb yousaf on 05/07/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
class showingAlert:UIAlertController{
    func showAlert(Alert title: String,message: String,action: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: action, style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
        return
    }
}
