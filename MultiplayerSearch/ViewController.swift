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
        
    }
    
    @IBAction func actionSearchAgain(sender: UIButton) {
    UIApplication.sharedApplication().keyWindow!.rootViewController = storyboard!.instantiateViewControllerWithIdentifier("ViewController") as UIViewController
    }

}