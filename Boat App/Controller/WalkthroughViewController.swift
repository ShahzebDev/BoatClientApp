//
//  WalkthroughViewController.swift
//  Boat App
//
//  Created by shahzeb yousaf on 02/07/2020.
//  Copyright © 2020 Moazzam Tahir. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController {
    
    @IBOutlet var holderView: UIView!
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    //This func will setup the scroll view.
    private func configure(){

        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        
        //Array that hold different guide info.
        let info = ["This is first walkthrough page","This is second walkthrough page","This is final walkthrough page"]
        
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: CGFloat(x) * holderView.frame.size.width, y: 0, width: holderView.frame.size.width, height: holderView.frame.size.height))
            scrollView.addSubview(pageView)

            let view = UIView(frame: CGRect(x: 10, y: 10, width: 300, height: 300))
            
            let infoLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0 , width: holderView.frame.size.width, height: holderView.frame.size.height))
            
            let button = UIButton(type: .roundedRect)
            
            button.frame = CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width-20, height: 50)
            
            view.backgroundColor = UIColor.black
            view.alpha = 0.5
            view.center = imageView.center
            infoLabel.text = info[x]
            infoLabel.textColor = UIColor.white
            infoLabel.textAlignment = .center
            infoLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
            infoLabel.adjustsFontSizeToFitWidth = true
            
            imageView.addSubview(view)
            view.addSubview(infoLabel)
            

            imageView.contentMode = .scaleToFill
            imageView.image = UIImage(named: "welcome\(x+1)")
            pageView.addSubview(imageView)
            
            button.layer.cornerRadius = 20
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Next", for: .normal)
            button.backgroundColor = .systemBlue
            
            if x == 2 {
                button.setTitle("Get Started", for: .normal)
            }
            button.addTarget(self, action: #selector(continueBtn(_:)), for: .touchUpInside)
            button.tag = x + 1
            pageView.addSubview(button)
        }
        
        scrollView.contentSize =  CGSize(width: holderView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true
        
    }
    
    @objc func continueBtn(_ button: UIButton){
        guard button.tag < 3 else {
            //dismissing
            Core.shared.setIsNotNewUser()
            //self.dismiss(animated: true, completion: nil)
            
            //MARK:- Moving to Main screen.
            let story = UIStoryboard.init(name: "Main", bundle: Bundle.main)
            let vc = story.instantiateViewController(identifier: "home") as! MainScreenViewController
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.rootViewController = vc
            return
        }
        
        //scrollView to next page
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width * CGFloat(button.tag), y: 0), animated: true)
    }
}
