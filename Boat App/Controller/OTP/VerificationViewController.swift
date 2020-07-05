//
//  VerificationViewController.swift
//  Boat App
//
//  Created by shahzeb yousaf on 02/07/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit

class VerificationViewController: UIViewController {
    
    @IBOutlet var imageNameField: UITextField!
     
    @IBOutlet var continueBtn: RoundButton!
    var window: UIWindow!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageNameField.backgroundColor = UIColor.clear
        continueBtn.isEnabled = false
        border(textField: imageNameField)
    }
    
    
    @IBAction func uploadImage(_ sender: UIButton){
        popUpImagePickerController()
    }
    
    @IBAction func continuebutton(_ sender: UIButton){
        //MARK:- Moving to Mobile Required Screen.
        
        let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let vc = story.instantiateViewController(identifier: "mobile")
        self.present(vc, animated: true, completion: nil)
        
    }
    
    func border(textField: UITextField){
        let layer = CALayer()
        layer.frame = CGRect(x: 0.0, y: imageNameField.frame.size.height - 2.0, width: imageNameField.frame.size.width, height: 2.0)
        
        layer.backgroundColor = UIColor.white.cgColor
        imageNameField.layer.addSublayer(layer)
    }
    
}
extension VerificationViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func popUpImagePickerController(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true) {
            print("image picker controller is showing")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let _ = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageNameField.text = "image.jpg"
            continueBtn.isEnabled = true
            continueBtn.backgroundColor = UIColor.systemGreen
            //here we perform our backend that will send this photo our database
            
        }else if let _ = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageNameField.text = "image.jpg"
            continueBtn.isEnabled = true
             continueBtn.backgroundColor = UIColor.systemGreen
            //here we perform our backend that will send this photo our database
        }
        dismiss(animated: true) {
            print("dismissing image picker controller")
        }
    }
    
    
}
