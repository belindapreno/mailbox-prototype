//
//  MailboxViewController.swift
//  Week3HW_Mailbox
//
//  Created by Belinda Preno on 8/21/14.
//  Copyright (c) 2014 bp. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var messageImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSizeMake(320, 2000)
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        messageImageView.addGestureRecognizer(panGestureRecognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 300
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 50
    }
    
    func onCustomPan(panGestureRecognizer: UIPanGestureRecognizer) {
        var point = panGestureRecognizer.locationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            
        }
    }
    
    
}
