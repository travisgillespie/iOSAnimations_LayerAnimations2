//
//  ViewController.swift
//  MultiplayerSearch
//
//  Created by Travis Gillespie on 1/9/16.
//  Copyright © 2016 Travis Gillespie. All rights reserved.
//

import UIKit

// Util delay function

func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var vs: UILabel!
    
    @IBOutlet weak var opponentAvatar: AvatarView!
    @IBOutlet weak var myAvatar: AvatarView!
    
    @IBOutlet weak var searchAgain: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        searchForOpponent()
        
    }
    
    @IBAction func actionSearchAgain(sender: UIButton) {
    UIApplication.sharedApplication().keyWindow!.rootViewController = storyboard!.instantiateViewControllerWithIdentifier("ViewController") as UIViewController
    }
    
    func searchForOpponent() {
        let avatarSize = myAvatar.frame.size
        let bounceXOffset: CGFloat = avatarSize.width/1.9
        let morphSize = CGSize(
            width: avatarSize.width * 0.85,
            height: avatarSize.height * 1.1)
        
        let rightBouncePoint = CGPoint(
            x: view.frame.size.width/2.0 + bounceXOffset,
            y: myAvatar.center.y)
        let leftBouncePoint = CGPoint(
            x: view.frame.size.width/2.0 - bounceXOffset,
            y: myAvatar.center.y)
        
        myAvatar.bounceOffPoint(rightBouncePoint, morphSize: morphSize)
        opponentAvatar.bounceOffPoint(leftBouncePoint, morphSize: morphSize)
        
        delay(seconds: 4.0, completion: foundOpponent)
    }
    
    func foundOpponent() {
        status.text = "Connecting..."
        
        opponentAvatar.image = UIImage(named: "avatar-2")
        opponentAvatar.name = "Ray"
        
        delay(seconds: 4.0, completion: connectedToOpponent)
    }
    
    func connectedToOpponent() {
        myAvatar.shouldTransitionToFinishedState = true
        opponentAvatar.shouldTransitionToFinishedState = true
        
        delay(seconds: 1.0, completion: completed)
    }
    
    func completed() {
        status.text = "Ready to play"
        UIView.animateWithDuration(0.2) {
            self.vs.alpha = 1.0
            self.searchAgain.alpha = 1.0
        }
    }
}