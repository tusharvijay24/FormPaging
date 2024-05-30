//
//  TfApp.swift
//  MyUI
//
//  Created by Suyog Dubey on 31/07/23.
//

import UIKit

class TfApp: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        textColor = AppTheme.setColor(.colorBlack)()
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = UINumberConstant.radius15
        clipsToBounds = true
        addTextFieldPadding()
    }
    
    private func addTextFieldPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
        leftView = paddingView
        leftViewMode = .always
    }
}
