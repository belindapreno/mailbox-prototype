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
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var laterImageView: UIImageView!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var deferButton: UIButton!
    @IBOutlet weak var listButton: UIButton!

    
    var messageFrame: CGPoint!
    var messagePosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.selectedSegmentIndex=1;
        
        scrollView.contentSize = CGSizeMake(320, 2000)
        var panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "onCustomPan:")
        messageImageView.addGestureRecognizer(panGestureRecognizer)
        messageFrame = messageImageView.frame.origin
//        messagePosition = messageImageView.x

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
        var translate = panGestureRecognizer.translationInView(view)
        var velocity = panGestureRecognizer.velocityInView(view)
        
        var gutter = CGFloat(60.0)
        var shortSwipe = CGFloat(180)
        
        messageImageView.frame.origin.x = messageFrame.x + translate.x
        var x = messageImageView.frame.origin.x
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            messageImageView.frame.origin.x = messageFrame.x + translate.x
            
            var color:UIColor = UIColor.grayColor()
            
            if x > 0 {
                if x < gutter {
                    color = UIColor.lightGrayColor()
                    archiveImageView.alpha = 1
                } else if x < shortSwipe {
                   color = UIColor(red: 97/255.0, green: 217/255.0, blue: 97/255.0, alpha: 1.0)
                    archiveImageView.alpha = 1
                    deleteImageView.alpha = 0
                    archiveImageView.frame.origin.x = messageImageView.frame.origin.x - 50
                } else {
                    color = UIColor(red: 239/255.0, green: 83/255.0, blue: 10/255.0, alpha: 1.0)
                    deleteImageView.alpha = 1
                    archiveImageView.alpha = 0
                    deleteImageView.frame.origin.x = messageImageView.frame.origin.x - 50
                }
            } else {
                if x > -gutter {
                    color = UIColor.lightGrayColor()
                    laterImageView.alpha = 1
                } else if x > -shortSwipe {
                    color = UIColor(red: 255/255.0, green: 204/255.0, blue: 0/255.0, alpha: 1.0)
                    laterImageView.alpha = 1
                    listImageView.alpha = 0
                    laterImageView.frame.origin.x = (messageImageView.frame.origin.x + 320) + 30
                    
                } else {
                    color = UIColor(red: 216/255.0, green: 166/255.0, blue: 117/255.0, alpha: 1.0)
                    listImageView.alpha = 1
                    laterImageView.alpha = 0
                    listImageView.frame.origin.x = (messageImageView.frame.origin.x + 320) + 30
                }
            }

            contentView.backgroundColor = color
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            var newX = CGFloat(0.0)
            
            if x > 0 {
                if x > gutter {
                    newX = messageImageView.frame.size.width
                }
            } else {
                if x < -gutter {
                    newX = -messageImageView.frame.size.width
                    if x > -shortSwipe {
                        deferButton.alpha = 1
                    } else {
                         listButton.alpha = 1
                }
                }
            }

            UIView.animateKeyframesWithDuration(0.5, delay: 0, options: nil, animations: {
                self.archiveImageView.frame.origin.x += self.feedImageView.frame.size.width
                self.deleteImageView.frame.origin.x += self.feedImageView.frame.size.width
                self.laterImageView.frame.origin.x -= self.feedImageView.frame.size.width
                self.listImageView.frame.origin.x -= self.feedImageView.frame.size.width
                }, completion: nil)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.messageImageView.frame.origin.x = newX
            })
            
            if (x > gutter || x < -gutter) {
                UIView.animateWithDuration(0.3, delay: 0.5, options: nil, animations: {
                    self.feedImageView.frame.origin.y = self.feedImageView.frame.origin.y - 86
                }, completion: nil)
                
            }
        }
    }
    
    @IBAction func onTapListButton(sender: AnyObject) {
        listButton.alpha = 0
    }
    
    @IBAction func onTapDeferButton(sender: AnyObject) {
        deferButton.alpha = 0
    }

    
}
