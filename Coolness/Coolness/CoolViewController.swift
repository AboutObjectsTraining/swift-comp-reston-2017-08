//
//  CoolViewController.swift
//  Coolness
//
//  Created by Jonathan Lehr on 8/29/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

let accessoryHeight = CGFloat(80.0)

class CoolViewController: UIViewController
{
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.brown
        
        let accessoryRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: accessoryHeight)
        let contentRect = UIScreen.main.bounds
            .insetBy (dx: 0, dy: accessoryHeight / 2)
            .offsetBy(dx: 0, dy: accessoryHeight / 2)
        
        let accessoryView = UIView(frame: accessoryRect)
        let contentView = UIView(frame: contentRect)
        let subview1 = CoolViewCell(frame: CGRect(x: 20, y: 60, width: 80, height: 30))
        let subview2 = CoolViewCell(frame: CGRect(x: 50, y: 100, width: 80, height: 30))
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        contentView.addSubview(subview1)
        contentView.addSubview(subview2)
        
        subview1.text = "The race is to the Swift 🚀"
        subview2.text = "Hello Xcode! 💻"
        
        subview1.sizeToFit()
        subview2.sizeToFit()
        
        accessoryView.backgroundColor = UIColor(white: 1.0, alpha: 0.75)
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        subview1.backgroundColor = UIColor.purple
        subview2.backgroundColor = UIColor.orange
    }
}
