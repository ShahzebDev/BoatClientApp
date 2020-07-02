//
//  SettingViewController.swift
//  Boat App
//
//  Created by shahzeb yousaf on 02/07/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpTheView()

        // Do any additional setup after loading the view.
    }
    

    func settingUpTheView(){
        let bgView = UIImageView(frame: CGRect())
        bgView.image = #imageLiteral(resourceName: "angryimg-3")
        bgView.isUserInteractionEnabled = true
        view.addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.clipsToBounds = true
                           
        bgView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        bgView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        let navbarView = UIView(frame:CGRect())
        navbarView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bgView.addSubview(navbarView)
        navbarView.translatesAutoresizingMaskIntoConstraints = false
        navbarView.clipsToBounds = true
        navbarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
                   
         navbarView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
         navbarView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                    
                
            let backbtn = UIButton(frame: CGRect(x: 30, y: 50, width: 25, height: 25))
                            backbtn.setImage(#imageLiteral(resourceName: "left-arrow"), for: .normal)
                backbtn.addTarget(self, action: #selector(self.backbtnAction), for: .touchUpInside)
                            navbarView.addSubview(backbtn)
                            
       
            let centerLabel = UILabel(frame: CGRect(x: 160, y: 50, width: 100, height: 25))
                            
                            centerLabel.text = "Settings"
                            centerLabel.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
                            centerLabel.font =  UIFont.boldSystemFont(ofSize: 20)
                            navbarView.addSubview(centerLabel)
                            
            let Searchbtn = UIButton(frame: CGRect(x: 370, y: 50, width: 30, height: 30))
                            Searchbtn.setImage(#imageLiteral(resourceName: "ellipsis"), for: .normal)
                            navbarView.addSubview(Searchbtn)
                    
              
                
                
                let NameView = UIView(frame:CGRect())
                           
                    NameView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                    bgView.addSubview(NameView)
                           
                           
                    NameView.translatesAutoresizingMaskIntoConstraints = false
                    NameView.clipsToBounds = true
                           
                    NameView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
                          
                    NameView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                    NameView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                
         //-------------------------- IconImage ---------------------------------------
                
                let NameImage = UIImageView()
                    NameImage.image = #imageLiteral(resourceName: "pencil-edit-button")
                    NameView.addSubview(NameImage)
                

                    NameImage.translatesAutoresizingMaskIntoConstraints = false
                    NameImage.clipsToBounds = true
                
                
                    NameImage.centerXAnchor.constraint(equalTo: NameView.centerXAnchor, constant: -170).isActive = true
                    NameImage.centerYAnchor.constraint(equalTo: NameView.centerYAnchor, constant: 0).isActive = true
                    NameImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
                    NameImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
                
                
                
           
                
          
                
                let NameLabel = UILabel()
                    NameLabel.text = "Me"
                NameLabel.font = UIFont(name: "AlNile", size: 18)
                NameLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                    NameView.addSubview(NameLabel)
                

                    NameLabel.translatesAutoresizingMaskIntoConstraints = false
                    NameLabel.clipsToBounds = true
                
                
                    NameLabel.centerXAnchor.constraint(equalTo: NameView.centerXAnchor, constant: -70).isActive = true
                    NameLabel.centerYAnchor.constraint(equalTo: NameView.centerYAnchor, constant: 0).isActive = true
                    NameLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
                    NameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
                
                
                
                
                let NameLabel2 = UILabel()
                NameLabel2.text = UserDefaults.standard.string(forKey: "user_name")
                       NameLabel2.font = UIFont(name: "AlNile", size: 18)
                       NameLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                           NameView.addSubview(NameLabel2)
                       

                           NameLabel2.translatesAutoresizingMaskIntoConstraints = false
                           NameLabel2.clipsToBounds = true
                       
                       
                           NameLabel2.centerXAnchor.constraint(equalTo: NameView.centerXAnchor, constant: 100).isActive = true
                           NameLabel2.centerYAnchor.constraint(equalTo: NameView.centerYAnchor, constant: 0).isActive = true
                           NameLabel2.widthAnchor.constraint(equalToConstant: 160).isActive = true
                           NameLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
                       
                       
                
                
                
                
                
                
                
                
        // ----------------------------------- Notification View ----------------------------
                
                
                let NotificationView = UIView(frame:CGRect())
                                  
                                      NotificationView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                                      bgView.addSubview(NotificationView)
                                  
                                  
                                      NotificationView.translatesAutoresizingMaskIntoConstraints = false
                                      NotificationView.clipsToBounds = true
                                  
                                      NotificationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 240).isActive = true
                                 
                                      NotificationView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                                      NotificationView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                
                 
            
                
                
                 let NotificationImage = UIImageView()
                          NotificationImage.image = #imageLiteral(resourceName: "notification")
                          NotificationView.addSubview(NotificationImage)
                      

                          NotificationImage.translatesAutoresizingMaskIntoConstraints = false
                          NotificationImage.clipsToBounds = true
                      
                      
                          NotificationImage.centerXAnchor.constraint(equalTo: NotificationView.centerXAnchor, constant: -170).isActive = true
                          NotificationImage.centerYAnchor.constraint(equalTo: NotificationView.centerYAnchor, constant: 0).isActive = true
                          NotificationImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
                          NotificationImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                 
                      
                
                      
                      let NotificationLabel = UILabel()
                          NotificationLabel.text = "Notification"
                      NotificationLabel.font = UIFont(name: "AlNile", size: 18)
                      NotificationLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                          NotificationView.addSubview(NotificationLabel)
                      

                          NotificationLabel.translatesAutoresizingMaskIntoConstraints = false
                          NotificationLabel.clipsToBounds = true
                      
                      
                          NotificationLabel.centerXAnchor.constraint(equalTo: NotificationView.centerXAnchor, constant: -70).isActive = true
                          NotificationLabel.centerYAnchor.constraint(equalTo: NotificationView.centerYAnchor, constant: 0).isActive = true
                          NotificationLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
                          NotificationLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                      
                      let NotificationLabel2 = UILabel()
                                 NotificationLabel2.text = "All "
                             NotificationLabel2.font = UIFont(name: "AlNile", size: 18)
                             NotificationLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                                 NotificationView.addSubview(NotificationLabel2)
                             

                                 NotificationLabel2.translatesAutoresizingMaskIntoConstraints = false
                                 NotificationLabel2.clipsToBounds = true
                             
                             
                                 NotificationLabel2.centerXAnchor.constraint(equalTo: NotificationView.centerXAnchor, constant: 100).isActive = true
                                 NotificationLabel2.centerYAnchor.constraint(equalTo: NotificationView.centerYAnchor, constant: 0).isActive = true
                                 NotificationLabel2.widthAnchor.constraint(equalToConstant: 80).isActive = true
                                 NotificationLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
                             
                             
                      
                      
                      
                      
                      
                      
                
                
                
                
                
                
        // ----------------------------------- General View ----------------------------
                
                
                let GenrealView = UIView(frame:CGRect())
                                  
                GenrealView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                bgView.addSubview(GenrealView)
                                  
                                  
                    GenrealView.translatesAutoresizingMaskIntoConstraints = false
                    GenrealView.clipsToBounds = true
                                  
                    GenrealView.topAnchor.constraint(equalTo: view.topAnchor, constant: 330).isActive = true
                                 
                    GenrealView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                    GenrealView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                
                
                
                let GeneralImage = UIImageView()
                          GeneralImage.image = #imageLiteral(resourceName: "setting")
                          GenrealView.addSubview(GeneralImage)
                      

                          GeneralImage.translatesAutoresizingMaskIntoConstraints = false
                          GeneralImage.clipsToBounds = true
                      
                      
                          GeneralImage.centerXAnchor.constraint(equalTo: GenrealView.centerXAnchor, constant: -170).isActive = true
                          GeneralImage.centerYAnchor.constraint(equalTo: GenrealView.centerYAnchor, constant: 0).isActive = true
                          GeneralImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
                          GeneralImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                 
                      
                
                      
                      let GeneralLabel = UILabel()
                          GeneralLabel.text = "General"
                      GeneralLabel.font = UIFont(name: "AlNile", size: 18)
                      GeneralLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                          GenrealView.addSubview(GeneralLabel)
                      

                          GeneralLabel.translatesAutoresizingMaskIntoConstraints = false
                          GeneralLabel.clipsToBounds = true
                      
                      
                          GeneralLabel.centerXAnchor.constraint(equalTo: GenrealView.centerXAnchor, constant: -70).isActive = true
                          GeneralLabel.centerYAnchor.constraint(equalTo: GenrealView.centerYAnchor, constant: 0).isActive = true
                          GeneralLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
                          GeneralLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                      
                      let GeneralLabel2 = UILabel()
                                 GeneralLabel2.text = "Photos "
                             GeneralLabel2.font = UIFont(name: "AlNile", size: 18)
                             GeneralLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                                 GenrealView.addSubview(GeneralLabel2)
                             

                                 GeneralLabel2.translatesAutoresizingMaskIntoConstraints = false
                                 GeneralLabel2.clipsToBounds = true
                             
                             
                                 GeneralLabel2.centerXAnchor.constraint(equalTo: GenrealView.centerXAnchor, constant: 100).isActive = true
                                 GeneralLabel2.centerYAnchor.constraint(equalTo: GenrealView.centerYAnchor, constant: 0).isActive = true
                                 GeneralLabel2.widthAnchor.constraint(equalToConstant: 140).isActive = true
                                 GeneralLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
                             
                             
                      
                      
        // ----------------------------------- Account View ----------------------------
                
                
                let AccountView = UIView(frame:CGRect())
                                  
                AccountView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                bgView.addSubview(AccountView)
                                  
                                  
                    AccountView.translatesAutoresizingMaskIntoConstraints = false
                    AccountView.clipsToBounds = true
                                  
                    AccountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 420).isActive = true
                                 
                    AccountView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                    AccountView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                
                
                
                let AccountImage = UIImageView()
                          AccountImage.image = #imageLiteral(resourceName: "avatar")
                          AccountView.addSubview(AccountImage)
                      

                          AccountImage.translatesAutoresizingMaskIntoConstraints = false
                          AccountImage.clipsToBounds = true
                      
                      
                          AccountImage.centerXAnchor.constraint(equalTo: AccountView.centerXAnchor, constant: -170).isActive = true
                          AccountImage.centerYAnchor.constraint(equalTo: AccountView.centerYAnchor, constant: 0).isActive = true
                          AccountImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
                          AccountImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                 
                      
                
                      
                      let AccountLabel = UILabel()
                          AccountLabel.text = "Account"
                      AccountLabel.font = UIFont(name: "AlNile", size: 18)
                      AccountLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                          AccountView.addSubview(AccountLabel)
                      

                          AccountLabel.translatesAutoresizingMaskIntoConstraints = false
                          AccountLabel.clipsToBounds = true
                      
                      
                          AccountLabel.centerXAnchor.constraint(equalTo: AccountView.centerXAnchor, constant: -70).isActive = true
                          AccountLabel.centerYAnchor.constraint(equalTo: AccountView.centerYAnchor, constant: 0).isActive = true
                          AccountLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
                          AccountLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                      
                      let AccountLabel2 = UILabel()
                AccountLabel2.text = UserDefaults.standard.string(forKey: "user_email")
                             AccountLabel2.font = UIFont(name: "AlNile", size: 18)
                             AccountLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                                 AccountView.addSubview(AccountLabel2)
                             

                                 AccountLabel2.translatesAutoresizingMaskIntoConstraints = false
                                 AccountLabel2.clipsToBounds = true
                             
                             
                                 AccountLabel2.centerXAnchor.constraint(equalTo: AccountView.centerXAnchor, constant: 60).isActive = true
                                 AccountLabel2.centerYAnchor.constraint(equalTo: AccountView.centerYAnchor, constant: 0).isActive = true
                                 AccountLabel2.widthAnchor.constraint(equalToConstant: 180).isActive = true
                                 AccountLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
                             
                             
                
                
                
        // ----------------------------------- Privacy View ----------------------------
                
                
                let privacyView = UIView(frame:CGRect())
                                  
                privacyView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                bgView.addSubview(privacyView)
                                  
                                  
                    privacyView.translatesAutoresizingMaskIntoConstraints = false
                    privacyView.clipsToBounds = true
                                  
                    privacyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 510).isActive = true
                                 
                    privacyView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                    privacyView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                
                
                
                let privacyImage = UIImageView()
                          privacyImage.image = #imageLiteral(resourceName: "shield-with-lock")
                          privacyView.addSubview(privacyImage)
                      

                          privacyImage.translatesAutoresizingMaskIntoConstraints = false
                          privacyImage.clipsToBounds = true
                      
                      
                          privacyImage.centerXAnchor.constraint(equalTo: privacyView.centerXAnchor, constant: -170).isActive = true
                          privacyImage.centerYAnchor.constraint(equalTo: privacyView.centerYAnchor, constant: 0).isActive = true
                          privacyImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
                          privacyImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                 
                      
                
                      
                      let privacyLabel = UILabel()
                          privacyLabel.text = "Privacy"
                      privacyLabel.font = UIFont(name: "AlNile", size: 18)
                      privacyLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                          privacyView.addSubview(privacyLabel)
                      

                          privacyLabel.translatesAutoresizingMaskIntoConstraints = false
                          privacyLabel.clipsToBounds = true
                      
                      
                          privacyLabel.centerXAnchor.constraint(equalTo: privacyView.centerXAnchor, constant: -70).isActive = true
                          privacyLabel.centerYAnchor.constraint(equalTo: privacyView.centerYAnchor, constant: 0).isActive = true
                          privacyLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
                          privacyLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                      
                      let privacyLabel2 = UILabel()
                                 privacyLabel2.text = "Only me "
                             privacyLabel2.font = UIFont(name: "AlNile", size: 18)
                             privacyLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                                 privacyView.addSubview(privacyLabel2)
                             

                                 privacyLabel2.translatesAutoresizingMaskIntoConstraints = false
                                 privacyLabel2.clipsToBounds = true
                             
                             
                                 privacyLabel2.centerXAnchor.constraint(equalTo: privacyView.centerXAnchor, constant: 60).isActive = true
                                 privacyLabel2.centerYAnchor.constraint(equalTo: privacyView.centerYAnchor, constant: 0).isActive = true
                                 privacyLabel2.widthAnchor.constraint(equalToConstant: 140).isActive = true
                                 privacyLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
                             
                             
                
            
                
                
                
                
                
                
                
           // ----------------------------------- Block View ----------------------------
                
                
                let blockView = UIView(frame:CGRect())
                                  
                blockView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                bgView.addSubview(blockView)
                                  
                                  
                    blockView.translatesAutoresizingMaskIntoConstraints = false
                    blockView.clipsToBounds = true
                                  
                    blockView.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
                                 
                    blockView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                    blockView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                
                
                
                let blockImage = UIImageView()
                          blockImage.image = #imageLiteral(resourceName: "signal")
                          blockView.addSubview(blockImage)
                      

                          blockImage.translatesAutoresizingMaskIntoConstraints = false
                          blockImage.clipsToBounds = true
                      
                      
                          blockImage.centerXAnchor.constraint(equalTo: blockView.centerXAnchor, constant: -170).isActive = true
                          blockImage.centerYAnchor.constraint(equalTo: blockView.centerYAnchor, constant: 0).isActive = true
                          blockImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
                          blockImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                 
                      
                
                      
                      let blockLabel = UILabel()
                          blockLabel.text = "Block"
                      blockLabel.font = UIFont(name: "AlNile", size: 18)
                      blockLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                          blockView.addSubview(blockLabel)
                      

                          blockLabel.translatesAutoresizingMaskIntoConstraints = false
                          blockLabel.clipsToBounds = true
                      
                      
                          blockLabel.centerXAnchor.constraint(equalTo: blockView.centerXAnchor, constant: -70).isActive = true
                          blockLabel.centerYAnchor.constraint(equalTo: blockView.centerYAnchor, constant: 0).isActive = true
                          blockLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
                          blockLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                      
                      let blockLabel2 = UILabel()
                                 blockLabel2.text = "None "
                             blockLabel2.font = UIFont(name: "AlNile", size: 18)
                             blockLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                                 blockView.addSubview(blockLabel2)
                             

                                 blockLabel2.translatesAutoresizingMaskIntoConstraints = false
                                 blockLabel2.clipsToBounds = true
                             
                             
                                 blockLabel2.centerXAnchor.constraint(equalTo: blockView.centerXAnchor, constant: 60).isActive = true
                                 blockLabel2.centerYAnchor.constraint(equalTo: blockView.centerYAnchor, constant: 0).isActive = true
                                 blockLabel2.widthAnchor.constraint(equalToConstant: 140).isActive = true
                                 blockLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
                             
                             
                
         // ----------------------------------- Help View ----------------------------
                
                
                let helpView = UIView(frame:CGRect())
                                  
                helpView.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                bgView.addSubview(helpView)
                                  
                                  
                    helpView.translatesAutoresizingMaskIntoConstraints = false
                    helpView.clipsToBounds = true
                                  
                    helpView.topAnchor.constraint(equalTo: view.topAnchor, constant: 690).isActive = true
                                 
                    helpView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                    helpView.heightAnchor.constraint(equalToConstant: 60).isActive = true
                
                
                
                let helpImage = UIImageView()
                          helpImage.image = #imageLiteral(resourceName: "help-web-button")
                          helpView.addSubview(helpImage)
                      

                          helpImage.translatesAutoresizingMaskIntoConstraints = false
                          helpImage.clipsToBounds = true
                      
                      
                          helpImage.centerXAnchor.constraint(equalTo: helpView.centerXAnchor, constant: -170).isActive = true
                          helpImage.centerYAnchor.constraint(equalTo: helpView.centerYAnchor, constant: 0).isActive = true
                          helpImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
                          helpImage.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                 
                      
                
                      
                      let helpLabel = UILabel()
                          helpLabel.text = "Help"
                      helpLabel.font = UIFont(name: "AlNile", size: 18)
                      helpLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                          helpView.addSubview(helpLabel)
                      

                          helpLabel.translatesAutoresizingMaskIntoConstraints = false
                          helpLabel.clipsToBounds = true
                      
                      
                          helpLabel.centerXAnchor.constraint(equalTo: helpView.centerXAnchor, constant: -70).isActive = true
                          helpLabel.centerYAnchor.constraint(equalTo: helpView.centerYAnchor, constant: 0).isActive = true
                          helpLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
                          helpLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
                      
                      
                      
                      
            let helpLabel2 = UILabel()
                helpLabel2.text = "Questions? "
                helpLabel2.font = UIFont(name: "AlNile", size: 18)
                helpLabel2.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                helpView.addSubview(helpLabel2)
                             
                        helpLabel2.translatesAutoresizingMaskIntoConstraints = false
                        helpLabel2.clipsToBounds = true
                             
                        helpLabel2.centerXAnchor.constraint(equalTo: helpView.centerXAnchor, constant: 60).isActive = true
                        helpLabel2.centerYAnchor.constraint(equalTo: helpView.centerYAnchor, constant: 0).isActive = true
                        helpLabel2.widthAnchor.constraint(equalToConstant: 140).isActive = true
                        helpLabel2.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    @objc func backbtnAction(sender: UIButton!)
    {

        self.dismiss(animated:true, completion: nil)
        
        
    }

}
