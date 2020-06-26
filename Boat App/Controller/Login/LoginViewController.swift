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

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didTapLoginButton(_ sender: Any) {
        
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
    }
    
    @IBAction func didTapForgotPassward(_ sender: Any) {
    }
    
    
    
    
    
}

extension LoginViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error =  error{
            print("Error: \(error.localizedDescription)")
            return
        }
        let email = user.profile.email
        let username = user.profile.name
        
        print("User Information: \("Email: \(email)\n Username: \(username)")")
    }
}

extension LoginViewController:LoginButtonDelegate{
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
                
            }
        })
        
        let story = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = story.instantiateViewController(identifier: "mobile")
        self.present(vc, animated: true) {
            print("Mobile requried screen is showing")
        }
    }
}
