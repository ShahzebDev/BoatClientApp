//
//  MobileNumberViewController.swift
//  Boat App
//
//  Created by shahzeb yousaf on 27/06/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
import Firebase
class MobileNumberViewController: UIViewController {

    @IBOutlet var mobileNumber: UITextField!
    let ac = showingAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        border(textField: mobileNumber)
    }
    func border(textField: UITextField){
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        
        layer.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(layer)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let otpVC = segue.destination as? OTPViewController else {return}
        otpVC.phoneNumber = mobileNumber.text!
        
    }
    
    
    //MARK:- Authenticate User Provide Mobile Number.
    
    @IBAction func verifyMyNumber(_ sender: Any) {
        guard let mobilenumber = mobileNumber.text else {return}
        if mobilenumber == ""
        {
            self.ac.showAlert(Alert: "Field Required", message: "Please enter your mobile number starting from your country code ex: +92-3xxxxxxxx", action: "Okay")
        }
        else
        {
        PhoneAuthProvider.provider().verifyPhoneNumber(mobilenumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                self.ac.showAlert(Alert: "Server Response", message: error.localizedDescription, action: "Okay")
                print("Errro: \(error.localizedDescription)")
                return
            }
            UserDefaults.standard.set(verificationID, forKey: "verificationID")
            guard let uid =  UserDefaults.standard.string(forKey: "uid") else {return}
        
            let refereceVariable = Firebase.Database.database().reference(fromURL: "https://boat-user.firebaseio.com/")
            let userReference = refereceVariable.child("users").child(uid)
            let values = ["phone": mobilenumber]
            userReference.updateChildValues(values) { (error, DBRef) in
                if let error = error{
                    print("Error:\(error.localizedDescription)")
                    return
                }
            }
           
            
            //MARK:- Moving to OTP Screen.
            let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = story.instantiateViewController(identifier: "OTPScreen") as! OTPViewController
            self.present(vc, animated: true) {
                print("OTP Screen is showing")
            }
        }
     }
   }
}

