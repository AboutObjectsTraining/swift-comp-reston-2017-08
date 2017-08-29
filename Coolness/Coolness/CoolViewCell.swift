//
//  CoolViewCell.swift
//  Coolness
//
//  Created by Jonathan Lehr on 8/29/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

let textInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

class CoolViewCell: UIView {
    
    var text: String?
    
    var highlighted = false {
        didSet { alpha = highlighted ? 0.5 : 1.0 }
    }
}


// MARK: - UIView Geometry

extension CoolViewCell
{
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text as NSString? else { return size }

        let newSize = text.size(attributes: CoolViewCell.textAttributes)
        
        return CGSize(width: newSize.width + textInsets.left + textInsets.right,
                      height: newSize.height + textInsets.top + textInsets.bottom)
    }
}

// MARK: - UIView Drawing

extension CoolViewCell
{
    class var textAttributes: [String: Any] {
        return [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18.0),
                NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text as NSString? else { return }
        
        text.draw(at: CGPoint(x: textInsets.left, y: textInsets.top),
                  withAttributes: CoolViewCell.textAttributes)
    }
}

// MARK: - UIResponder Methods

extension CoolViewCell
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.bringSubview(toFront: self)
        highlighted = true
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let currLocation = touch.location(in: nil)
        let prevLocation = touch.previousLocation(in: nil)
        frame = frame.offsetBy(dx: currLocation.x - prevLocation.x,
                               dy: currLocation.y - prevLocation.y)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        highlighted = false
    }
}
