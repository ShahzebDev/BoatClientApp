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
            print("Sucessfully create new user to our database.")
        }
        
        PhoneAuthProvider.provider().verifyPhoneNumber(phone, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("Errro: \(error.localizedDescription)")
                return
            }
            
            UserDefaults.standard.set(verificationID, forKey: "verificationID")
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "OTPScreen") else {return}
            self.present(vc, animated: true) {
                print("OTP Screen is showing")
            }
        }
        
        
        
    }
    

}
