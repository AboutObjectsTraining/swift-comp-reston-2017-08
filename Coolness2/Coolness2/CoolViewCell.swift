//
//  CoolViewCell.swift
//  Coolness
//
//  Created by Jonathan Lehr on 8/29/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

fileprivate let textInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)

@IBDesignable class CoolViewCell: UIView {
    
    @IBInspectable var text: String? {
        didSet { sizeToFit() }
    }
    
    /// When true, the cell is highlighted by changing its alpha to 0.5;
    /// otherwise the alpha is 1.0
    var highlighted = false {
        didSet { alpha = highlighted ? 0.5 : 1.0 }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayer()
        configureGestureRecognizers()
    }
    
    // FIXME: Implement me!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureLayer()
        configureGestureRecognizers()
    }
    
    func configureLayer() {
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
    func configureGestureRecognizers() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(bounce))
        tapRecognizer.numberOfTapsRequired = 2
        addGestureRecognizer(tapRecognizer)
    }
    
    override func prepareForInterfaceBuilder() {
        layer.masksToBounds = true
    }
}

// MARK: - Core Animation
extension CoolViewCell
{
    func bounce() {
        print("In bounce...")
        animateBounce(size: CGSize(width: 120, height: 240), duration: 1.0)
    }
    
    func configureBounceAnimation(size: CGSize) {
        UIView.setAnimationRepeatCount(3.5)
        UIView.setAnimationRepeatAutoreverses(true)
        
        
        let translation = CGAffineTransform(translationX: size.width, y: size.height)
        self.transform = translation.rotated(by: CGFloat.pi / 2)
    }
    
    func animateFinishBounce(size: CGSize, duration: TimeInterval) {
        UIView.animate(withDuration: duration) { 
            self.transform = CGAffineTransform.identity
        }
    }
    
    func animateBounce(size: CGSize, duration: TimeInterval) {
        UIView.animate(withDuration: duration,
                       animations: { self.configureBounceAnimation(size: size) },
                       completion: { _ in  self.animateFinishBounce(size: size, duration: duration) })
    }
}

// MARK: - UIView Geometry
extension CoolViewCell
{
    /// Overrides sizeThatFits to return a new size that fully fits
    /// the rendered content of the text property, including edge insets.
    ///
    /// - Parameter size: the current size
    /// - Returns: the new size
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let text = text as NSString? else { return size }

        let newSize = text.size(attributes: CoolViewCell.textAttributes)
        
        return CGSize(width: newSize.width + textInsets.left + textInsets.right,
                      height: newSize.height + textInsets.top + textInsets.bottom)
    }
}

// MARK: - UIView Drawing

private let textOrigin = CGPoint(x: textInsets.left, y: textInsets.top)
private let defaultTextAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 18.0),
                                     NSForegroundColorAttributeName: UIColor.white]

extension CoolViewCell
{
    class var textAttributes: [String: Any] {
        return defaultTextAttributes
    }
    
    override func draw(_ rect: CGRect) {
        guard let text = text as NSString? else { return }
        text.draw(at: textOrigin, withAttributes: type(of: self).textAttributes)
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
