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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        textField1.addTarget(self, action: #selector(self.textFieldDidChange(uitextField:)), for: UIControl.Event.editingChanged)
        textField2.addTarget(self, action: #selector(self.textFieldDidChange(uitextField:)), for: UIControl.Event.editingChanged)
        textField3.addTarget(self, action: #selector(self.textFieldDidChange(uitextField:)), for: UIControl.Event.editingChanged)
        textField4.addTarget(self, action: #selector(self.textFieldDidChange(uitextField:)), for: UIControl.Event.editingChanged)
        textField5.addTarget(self, action: #selector(self.textFieldDidChange(uitextField:)), for: UIControl.Event.editingChanged)
        textField6.addTarget(self, action: #selector(self.textFieldDidChange(uitextField:)), for: UIControl.Event.editingChanged)
        
        verifyButton.isHighlighted = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        textField1.becomeFirstResponder()
    }
    
   @objc func textFieldDidChange(uitextField: UITextField){
        let text = uitextField.text
        
        if text?.utf16.count == 1 {
            switch uitextField {
            case textField1:
                textField2.becomeFirstResponder()
                break
                case textField2:
                textField3.becomeFirstResponder()
                break
                case textField3:
                textField4.becomeFirstResponder()
                break
                case textField4:
                textField5.becomeFirstResponder()
                break
                case textField5:
                textField6.becomeFirstResponder()
                break
                case textField6:
                textField6.becomeFirstResponder()
                verifyButton.isHighlighted = false
                break
            default:
                break
            }
        }
        else {
            
        }
    }
    
    
   @IBAction func verifyOTPCode(){
    print("You're verified")
    let ac = UIAlertController(title: "Success", message: "We have successfully verified your phone number", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action: UIAlertAction) in
        print("Alert is pressed!")
    }))
    self.present(ac, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
