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
    
    
    
    @IBAction func verifyMyNumber(_ sender: Any) {
        guard let mobileNumber = mobileNumber.text else {return}
        PhoneAuthProvider.provider().verifyPhoneNumber(mobileNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("Errro: \(error.localizedDescription)")
                return
            }
            
            UserDefaults.standard.set(verificationID, forKey: "verificationID")
            let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = story.instantiateViewController(identifier: "OTPScreen") as! OTPViewController
            self.present(vc, animated: true) {
                print("OTP Screen is showing")
            }
        }
        
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
