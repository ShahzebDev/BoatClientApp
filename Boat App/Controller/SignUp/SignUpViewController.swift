//
//  SignUpViewController.swift
//  Boat App
//
//  Created by Moazzam Tahir on 31/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let refereceVariable = Firebase.Database.database().reference(fromURL: "https://boat-user.firebaseio.com/")
//        refereceVariable.updateChildValues(["someValues": 12345])
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapContinue(_ sender: Any) {
        guard let name = nameTextField.text else {return}
        guard let email = emailTextField.text else {return}
        guard let phone = phoneTextField.text else {return}
        guard let pass = passwordTextField.text else {return}
        
        
        Auth.auth().createUser(withEmail: email, password: pass) { (result, error) in
            if let err = error{
                print("Error while creating user \(err.localizedDescription)")
                return
            }
            
            
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
            UserDefaults.standard.set(email, forKey: "user_email")
            UserDefaults.standard.set(name, forKey: "user_name")
            UserDefaults.standard.set(phone, forKey: "user_phone")
            UserDefaults.standard.set(pass, forKey: "user_pass")
        }
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("Errro: \(error.localizedDescription)")
                return
            }

            UserDefaults.standard.set(verificationID, forKey: "verificationID")
            let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = story.instantiateViewController(withIdentifier: "verification") 
            self.present(vc, animated: true) {
                print("verification Screen is showing")
            }
        }
        
        
        
    }
    

}
