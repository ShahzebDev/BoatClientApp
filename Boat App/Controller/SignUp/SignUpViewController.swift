//
//  SignUpViewController.swift
//  Boat App
//
//  Created by Moazzam Tahir on 31/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation
class SignUpViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let location = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapContinue(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let email = emailTextField.text else {return}
        guard let phone = phoneTextField.text else {return}
        guard let pass = passwordTextField.text else {return}
        
        if (nameTextField.text == "") || (emailTextField.text == "") || (phoneTextField.text == "") || (passwordTextField.text == "")
        {
            self.showingAlert(Alert: "Fields Required", message: "Please fill out all the fields", action: "Okay")
        }
        else
        {
            print("User has fill all the fields")
        //Doing:- Creating a new user in our firebase database.
        
        Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
            if error != nil
            {
                self.showingAlert(Alert: "Server Response", message: error!.localizedDescription, action: "Okay")
            }
            else
            {
                
            guard let uid = result?.user.uid else {return}
            let refereceVariable = Firebase.Database.database().reference(fromURL: "https://boat-user.firebaseio.com/")
            let userReference = refereceVariable.child("users").child(uid)
            let values = ["name": name,"email": email,"phone": phone,"pass": pass]
            userReference.updateChildValues(values) { (error, DBRef) in
                if let error = error{
                    print("Error:\(error.localizedDescription)")
                    return
                }
            }
            print("Sucessfully create new user to our database.")
            guard let coordinates = self.location.location?.coordinate else {return}
            print(coordinates)
            UserDefaults.standard.set(uid, forKey: "uid")
            UserDefaults.standard.set(email, forKey: "user_email")
            UserDefaults.standard.set(name, forKey: "user_name")
            UserDefaults.standard.set(phone, forKey: "user_phone")
            UserDefaults.standard.set(pass, forKey: "user_pass")
        }
        
            //MARK:- Moving to Verification Screen.
        
            let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = story.instantiateViewController(withIdentifier: "verification")
            self.present(vc, animated: true) {
                print("verification Screen is showing")
        }

    }
    
 }
}
}
extension SignUpViewController{
    func showingAlert(Alert title: String,message: String,action: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: action, style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
        return
    }
}

