//
//  HomeViewController.swift
//  Boat App
//
//  Created by Moazzam Tahir on 18/06/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet var homeView: UILabel!
    @IBOutlet var profileView: UILabel!
    @IBOutlet var settingView: UILabel!
    @IBOutlet var requestView: UILabel!
    @IBOutlet var paymentView: UILabel!
    @IBOutlet var contactView: UILabel!
    @IBOutlet var logoutView: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var mapView: UIView!
    @IBOutlet var mapLocationLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func initializUI() {
        homeView.target(forAction: #selector(openHomeView), withSender: self)
        profileView.target(forAction: #selector(openpProfileView), withSender: self)
        settingView.target(forAction: #selector(openSettingView), withSender: self)
        requestView.target(forAction: #selector(openrRequestView), withSender: self)
        paymentView.target(forAction: #selector(openPaymentView), withSender: self)
        contactView.target(forAction: #selector(openContactView), withSender: self)
        logoutView.target(forAction: #selector(openLogoutView), withSender: self)
        
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
    }
    
    @objc
    func openHomeView() {
        
    }
    
    @objc
    func openpProfileView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "profile") as ProfileViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc
    func openSettingView() {
        
    }
    
    @objc
    func openrRequestView() {
        
    }
    
    @objc
    func openPaymentView() {
        
    }
    
    @objc
    func openContactView() {
        
    }
    
    @objc
    func openLogoutView() {
        
    }
    
    @IBAction func sendRequest(_ sender: Any) {
    }
    
    @IBAction func openSlideMenu(_ sender: Any) {
    }
    
    @IBAction func openNotificaitons(_ sender: Any) {
    }
    
    @IBAction func didTapCurrentLocationButton(_ sender: Any) {
    }
}
