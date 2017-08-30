//
//  CoolViewController.swift
//  Coolness
//
//  Created by Jonathan Lehr on 8/29/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

let accessoryHeight = CGFloat(80.0)


extension CoolViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class CoolViewController: UIViewController
{
    var textField: UITextField!
    var contentView: CoolView!
    
    func addCoolView() {
        print("In \(#function)")
        let cell = CoolViewCell()
        cell.text = textField.text
        cell.sizeToFit()
        contentView.add(cell: cell)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.brown
        
        let accessoryRect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: accessoryHeight)
        let contentRect = UIScreen.main.bounds
            .insetBy (dx: 0, dy: accessoryHeight / 2)
            .offsetBy(dx: 0, dy: accessoryHeight / 2)
        
        let accessoryView = UIView(frame: accessoryRect)
        contentView = CoolView(frame: contentRect)
        let cell1 = CoolViewCell(frame: CGRect(x: 20, y: 60, width: 80, height: 30))
        let cell2 = CoolViewCell(frame: CGRect(x: 50, y: 120, width: 80, height: 30))
        
        view.addSubview(accessoryView)
        view.addSubview(contentView)
        
        
        // TODO: Add controls...
        
        textField = UITextField(frame: CGRect(x: 20, y: 40, width: 240, height: 30))
        accessoryView.addSubview(textField)
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter a label"
        
        textField.delegate = self
        
        let button = UIButton(type: .system)
        accessoryView.addSubview(button)
        button.setTitle("Add", for: .normal)
        button.sizeToFit()
        button.frame = button.frame.offsetBy(dx: 280, dy: 40)
        
        button.addTarget(self, action: #selector(addCoolView), for: .touchUpInside)
        
        contentView.add(cell: cell1)
        contentView.add(cell: cell2)
        
        cell1.text = "The race is to the Swift 🚀"
        cell2.text = "Hello Xcode! 💻"
        
        cell1.sizeToFit()
        cell2.sizeToFit()
        
        accessoryView.backgroundColor = UIColor(white: 1.0, alpha: 0.75)
        contentView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        cell1.backgroundColor = UIColor.purple
        cell2.backgroundColor = UIColor.orange
    }
}
