//
//  CustomTextfield.swift
//  WBooks
//
//  Created by c.betancourt on 16/08/21.
//

import UIKit

class CustomTextfield: UITextField {
    
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 20,
        bottom: 0,
        right: 30
    )
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        leftViewMode = .always
        textAlignment = .left
        backgroundColor = .white
        layer.cornerRadius = 25
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
}
