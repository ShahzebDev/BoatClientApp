//
//  OTPViewController.swift
//  Boat App
//
//  Created by shahzeb yousaf on 10/06/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
import Firebase
class OTPViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField6: UITextField!
    @IBOutlet var textField5: UITextField!
    @IBOutlet var textField4: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var verifyButton: RoundButton!
    
    
    var phoneNumber:String!
    var window: UIWindow!
    
    var otpValue = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        textField1.backgroundColor = UIColor.clear
        textField2.backgroundColor = UIColor.clear
        textField3.backgroundColor = UIColor.clear
        textField4.backgroundColor = UIColor.clear
        textField5.backgroundColor = UIColor.clear
        textField6.backgroundColor = UIColor.clear
        
        textField1.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        textField4.delegate = self
        textField5.delegate = self
        textField6.delegate = self
        
        border(textField: textField1)
        border(textField: textField2)
        border(textField: textField3)
        border(textField: textField4)
        border(textField: textField5)
        border(textField: textField6)
        
        verifyButton.isHighlighted = true
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text!.count) < 1 ) && (string.count > 0){
            if textField == textField1{
                textField2.becomeFirstResponder()
            }
            if textField == textField2{
                
                textField3.becomeFirstResponder()
            }
            if textField == textField3{
                 
                textField4.becomeFirstResponder()
            }
            if textField == textField4{
                
                textField5.becomeFirstResponder()
            }
            if textField == textField5{
                 
                textField6.becomeFirstResponder()
            }
            if textField == textField6{
                
                textField6.becomeFirstResponder()
                verifyButton.isHighlighted =  false
            }
            
            textField.text  = string
            return false
        }
        
        else if ((textField.text!.count) >= 1) && (string.count == 0)
        {
            if textField == textField2{
                textField1.becomeFirstResponder()
            }
            if textField == textField3{
                textField2.becomeFirstResponder()
            }
            if textField == textField4{
                textField3.becomeFirstResponder()
            }
            if textField == textField5{
                textField4.becomeFirstResponder()
            }
            if textField == textField6{
                textField5.becomeFirstResponder()
            }
            textField.text = ""
            return false
        }
        
        else if (textField.text!.count) >= 1 {
            textField.text = string
            return false
        }
        
        return true
    }
    
    
    func border(textField: UITextField){
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        
        layer.backgroundColor = UIColor.gray.cgColor
        textField.layer.addSublayer(layer)
    }
    
   
    
    
   @IBAction func verifyOTPCode(){
    
    print("otpvalue is: \(otpValue)")
    guard let tex1 = textField1.text else {return}
    guard let tex2 = textField2.text else {return}
    guard let tex3 = textField3.text else {return}
    guard let tex4 = textField4.text else {return}
    guard let tex5 = textField5.text else {return}
    guard let tex6 = textField6.text else {return}
    let code = tex1 + tex2 + tex3 + tex4 + tex5 + tex6
    guard let verificationID = UserDefaults.standard.string(forKey: "verificationID") else {return}

    //MARK:- Verifiying OTP Code.
    let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)

    Auth.auth().signIn(with: credentials) { (result, error) in
        if error != nil
        {
            print("Error: \(error!.localizedDescription)")
            let ac = UIAlertController(title: "Server Response", message: error!.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
            self.present(ac, animated: true, completion: nil)
            self.clearAllTextFields()
            return
        }
        else
        {
          self.customAlert(status: "You're Verified")
        }
    }
}
    @IBAction func resendCodeBtn(){
        guard let phonenumber = phoneNumber else {return}
       PhoneAuthProvider.provider().verifyPhoneNumber(phonenumber, uiDelegate: nil) { (verificationID, error) in
       if let error = error {
        let ac = UIAlertController(title: "Server Response", message: error.localizedDescription, preferredStyle: .alert)
         ac.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
         self.present(ac, animated: true, completion: nil)
         print("Errro: \(error.localizedDescription)")
           return
       }
        
        UserDefaults.standard.set(verificationID, forKey: "verificationID")
        let ac = UIAlertController(title: "Server Response", message: "We have sended OTP Code at \(phonenumber)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
        self.present(ac, animated: true, completion: nil)
        
    }
}
    
    
    func clearAllTextFields(){
         textField1.text = ""
         textField2.text = ""
         textField3.text = ""
         textField4.text = ""
         textField5.text = ""
         textField6.text = ""
    }
    
    func customAlert(status: String){
        let ac = UIAlertController(title: "Verification Status", message: status, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { (_) in
            print("cancel is pressed")
            //MARK:- Moving to Walkthrough Screen.
            
            let vc = self.storyboard?.instantiateViewController(identifier: "welcome") as! WalkthroughViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true) {
                
            print("Walkthrough screens is showing.")
            }
        }))
        self.present(ac, animated: true) {
            print("OTP Status Alert is showing")
        }
    
    }
    
}

