//
//  LoginViewController.swift
//  Boat App
//
//  Created by Moazzam Tahir on 31/05/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit
import FBSDKCoreKit
import FBSDKShareKit
class LoginViewController: UIViewController {

    @IBOutlet var phoneNumberTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    let ac = showingAlert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate =  self
        GIDSignIn.sharedInstance()?.presentingViewController = self
       
        if let token = AccessToken.current,
                !token.isExpired {
                // User is logged in, do work such as go to next view controller
                print("User is successufully loggedIn")
            }else{
                print("User is not sucessfully LoggedIn")
        }
    }
    

    @IBAction func didTapLoginButton(_ sender: Any) {
        guard let _ = phoneNumberTextField.text else {return}
        guard let _ = passwordTextField.text else {return}
    }
    
    
    @IBAction func didTapFacebookLogin(_ sender: Any) {
        LoginManager().logIn(permissions: ["public_profile","email"], from: self) { (result, error) in
            if error != nil{
                print("something wrong with custom facebook button")
                return
            }
            self.fetchUserProfile()
        }
    }
    
    
    
    @IBAction func didTapGoogleLogin(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
    }
    
    @IBAction func didTapTwitterLogin(_ sender: Any) {
        //TODO:-
    }
    
    @IBAction func didTapForgotPassward(_ sender: Any) {
        //TODO:-
    }
    
}

extension LoginViewController: GIDSignInDelegate{
    
    //MARK:- Getting Google user information.
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil
        {
            ac.showAlert(Alert: "Server Response", message: error!.localizedDescription, action: "Okay")
            print("Error: \(error.localizedDescription)")
            return
        }
        else
        {
        let email = user.profile.email ?? ""
        let username = user.profile.name ?? ""
        
        print("User Information: \("Email: \(email)\n Username: \(username)")")
        UserDefaults.standard.set(username, forKey: "user_name")
        //Here we can save our user data to boat server database.
        Auth.auth().createUser(withEmail: email, password: "123456789") { (result, error) in
        if error != nil
        {
            self.ac.showAlert(Alert: "Server Response", message: error!.localizedDescription, action: "Okay")
            return
        }
        else
        {
        guard let uid = result?.user.uid else {return}
        UserDefaults.standard.set(uid, forKey: "uid")
            
        let refereceVariable = Firebase.Database.database().reference(fromURL: "https://boat-user.firebaseio.com/")
        let userReference = refereceVariable.child("users").child(uid)
        let values = ["name": username,"email": email]
        userReference.updateChildValues(values) { (error, DBRef) in
            if error != nil{
                self.ac.showAlert(Alert: "Server Reponse", message: error!.localizedDescription, action: "Okay")
                print("Error:\(error!.localizedDescription)")
                return
            }else{
                print("ALL SAFE.")
            }
        }
        print("Sucessfully create new user to our database.")
        
        
        
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = story.instantiateViewController(identifier: "verification")
        self.present(vc, animated: true) {
            print("Mobile requried screen is showing")
        }
      }
    }
  }
 }
}

extension LoginViewController:LoginButtonDelegate{
    
    //MARK:- Getting Facebook user information.
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
         fetchUserProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("User is loggout")
    }
    
    
    func fetchUserProfile()
    {
        let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"id, email, name, picture.width(480).height(480)"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error took place: \(error ?? "nil" as! Error)")
            }
            else
            {
                print("Print entire fetched result: \(result ?? " ")")
                guard let data = result as? [String:Any] else { return }
                let fbid = data["id"]
                let username = data["name"]
                let firstName = data["first_name"]
                let dp = data["picture"]
                let image_url = data["url"]
                let email = data["email"]
                
                print("User ID is: \(String(describing: fbid))")
                print(username as Any)
                print(firstName as Any)
                print(image_url as Any)
                print(dp as Any)
                print(email as Any)
                print("http://graph.facebook.com/\(fbid!)/picture?type=large")
                UserDefaults.standard.set(username, forKey: "user_name")
                
                
                
                //Here we can save our data to boat server Database
                
                Auth.auth().createUser(withEmail: email as! String, password: "123456789") { (result, error) in
                if error != nil
                {
                    self.ac.showAlert(Alert: "Server Response", message: error!.localizedDescription, action: "Okay")
                }
                else
                {
                    
                guard let uid = result?.user.uid else {return}
                UserDefaults.standard.set(uid, forKey: "uid")
                let refereceVariable = Firebase.Database.database().reference(fromURL: "https://boat-user.firebaseio.com/")
                let userReference = refereceVariable.child("users").child(uid)
                let values = ["name": username,"email": email]
                userReference.updateChildValues(values) { (error, DBRef) in
                    if error != nil{
                        self.ac.showAlert(Alert: "Server Response", message: error!.localizedDescription, action: "Okay")
                        print("Error:\(error!.localizedDescription)")
                        return
                    }else{
                        print("ALL SAFE")
                    }
                }
                    print("Sucessfully create new user to our database.")
                }
              }
            }
        })
        
        
        //MARK:-  Moving to Verification Screen.
        
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = story.instantiateViewController(identifier: "verification")
        self.present(vc, animated: true) {
            print("Mobile requried screen is showing")
        }
    }
}
