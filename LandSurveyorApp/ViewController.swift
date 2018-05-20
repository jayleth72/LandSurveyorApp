//
//  ViewController.swift
//  LandSurveyorApp
//
//  Created by Jay Letheby on 19/5/18.
//  Copyright © 2018 Jay Letheby solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height: 0)
        
        viewConstraint.constant = -175
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
    }
    
    // This method enables user to swipe right to reveal menu
    // This method enables user to swipe left to hide menu
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 { // swipe right
                
                if viewConstraint.constant < 20 {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant  += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
                
            }else {              // swipe left
                if viewConstraint.constant > -175 {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant  += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }
            
        } else if sender.state == .ended {
            
                if viewConstraint.constant < -100 {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant  = -175
                        self.view.layoutIfNeeded()
                    })
    
                } else {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant  = 0
                        self.view.layoutIfNeeded()
                    })
    
                }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

