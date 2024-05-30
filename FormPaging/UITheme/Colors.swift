//
//  Colors.swift
//  MyUI
//
//  Created by Suyog Dubey on 31/07/23.
//

import Foundation
import UIKit

enum AppTheme : String {
    
    case colorGreen = "#00B000"
    case colorWhite = "#FFFFFF"
    case colorBlue = "#20C1ED"
    case colorBlueBorder = "#6DAEFF"
    case colorBlack = "#000000"
    
    func setColor() -> UIColor {
        return UIColor(hexFromString:self.rawValue)
    }
}


