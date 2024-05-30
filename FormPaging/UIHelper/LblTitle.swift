//
//  LblTitle.swift
//  MyUI
//
//  Created by Suyog Dubey on 31/07/23.
//

import Foundation
import UIKit

class LblTitle: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        CommonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        CommonInit()
    }
    
    private func CommonInit() {
        // Customize the appearance of the label
        self.textColor = AppTheme.setColor(.colorWhite)()
    }
}
