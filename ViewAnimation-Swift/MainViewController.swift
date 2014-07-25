//
//  MainViewController.swift
//  ViewAnimation-Swift
//
//  Created by Gazolla on 25/07/14.
//  Copyright (c) 2014 Gazolla. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var firstView:UIView?
    var secondView:UIView?
    var tapFirstView:UIGestureRecognizer?
    var navHeight:CGFloat?
    var width:CGFloat?
    var halfHeight:CGFloat?
    var height:CGFloat?
 
    convenience init(){
        self.init(nibName: nil, bundle: nil)
        
        navHeight = 0.0
        width = self.view.frame.size.width
        halfHeight = (self.view.frame.size.height - navHeight!)/2
        height = self.view.frame.size.height

        
        self.firstView = UIView(frame: CGRectMake(0.0, navHeight!, width!, halfHeight!))
        self.firstView!.backgroundColor = UIColor.lightGrayColor()
        self.firstView!.layer.cornerRadius = 5;
        self.firstView!.layer.borderWidth = 2;
        self.firstView!.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        self.secondView = UIView(frame: CGRectMake(0.0, halfHeight!+navHeight!, width!, halfHeight!))
        self.secondView!.tintColor = UIColor.whiteColor()
        self.secondView!.layer.cornerRadius = 5
        self.secondView!.layer.borderWidth = 1
        self.secondView!.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        self.tapFirstView = UITapGestureRecognizer(target: self, action: "firstViewTapped")
        
        self.firstView!.addGestureRecognizer(self.tapFirstView)
        
        self.view.addSubview(self.firstView)
        self.view.addSubview(self.secondView)
        
    }
    
    func firstViewTapped(){
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 20.0,
            options: UIViewAnimationOptions.CurveEaseIn ,
            animations: {
                self.firstView!.frame = CGRectMake(0.0, self.navHeight!, self.width!, self.height!)
                self.secondView!.center = CGPointMake(self.secondView!.center.x, self.secondView!.center.y+self.halfHeight!)
            },
            completion:{ (Bool)  in
                let leftBarButtonItem:UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "back"), style: UIBarButtonItemStyle.Plain, target: self, action: "reverse")
                self.navigationItem.leftBarButtonItem = leftBarButtonItem
            })
    }
    
    func reverse(){
        UIView.animateWithDuration(0.5,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 20.0,
            options: UIViewAnimationOptions.CurveEaseIn ,
            animations: {
                self.firstView!.frame = CGRectMake(0.0, self.navHeight!, self.width!, self.halfHeight!)
                self.secondView!.center = CGPointMake(self.secondView!.center.x, self.secondView!.center.y-self.halfHeight!)
            },
            completion:{ (Bool)  in
                self.navigationItem.leftBarButtonItem = nil
            })

    }
    
    
    
    
}
