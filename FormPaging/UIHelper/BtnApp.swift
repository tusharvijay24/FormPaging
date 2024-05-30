//
//  BtnApp.swift
//  MyUI
//
//  Created by Suyog Dubey on 31/07/23.
//

import UIKit

class BtnApp: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        CommonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CommonInit()
    }
    
    private func CommonInit() {
        self.backgroundColor = AppTheme.setColor(.colorBlue)()
        setTitleColor(AppTheme.setColor(.colorWhite)(), for: .normal)
        layer.cornerRadius = UINumberConstant.radius15
        layer.masksToBounds = false
    }
}
