//
//  CoolView.swift
//  Coolness
//
//  Created by Jonathan Lehr on 8/30/17.
//  Copyright © 2017 About Objects. All rights reserved.
//

import UIKit

class CoolView: UIView
{
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
    }
    
    func add(cell: CoolViewCell) {
        addSubview(cell)
    }
}
