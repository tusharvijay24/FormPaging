//
//  Utility.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import Foundation
import UIKit

let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate

public struct UINumberConstant {
    public static let radius5 = 5.0
    public static let radius10 = 10.0
    public static let radius15 = 15.0
    public static let radius20 = 20.0
    public static let radius30 = 30.0
}

// Alert

func showAlert(on viewController: UIViewController, title: String?, message: String?, cancel: String, confirm: String, action: @escaping () -> Void) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: cancel, style: .cancel, handler: nil)
    let confirmAction = UIAlertAction(title: confirm, style: .default) { (_) in
        action()
    }
    alertController.addAction(cancelAction)
    alertController.addAction(confirmAction)
    viewController.present(alertController, animated: true, completion: nil)
}


func showAlertWithOutCancel(on viewController: UIViewController, title: String, message: String, buttonTitle: String, completion: (() -> Void)?) {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: buttonTitle, style: .default) { (_) in
        completion?()
    }
    alertController.addAction(action)
    viewController.present(alertController, animated: true, completion: nil)
}


// Activity Indicator

var container: UIView = UIView()
var loadingView: UIView = UIView()
var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

func ShowActivityIndicator(uiView: UIView, indicatorColor: UIColor = AppTheme.colorBlack.setColor()) {
    container.frame = uiView.frame
    container.center = uiView.center
    container.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5)
    
    loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
    loadingView.center = uiView.center
    loadingView.backgroundColor = .clear
    loadingView.clipsToBounds = true
    loadingView.layer.cornerRadius = 10
    
    activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
    activityIndicator.style = UIActivityIndicatorView.Style.large
    activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
    activityIndicator.color = indicatorColor
    
    loadingView.addSubview(activityIndicator)
    container.addSubview(loadingView)
    uiView.addSubview(container)
    activityIndicator.startAnimating()
}

func HideActivityIndicator(uiView: UIView) {
    activityIndicator.stopAnimating()
    container.removeFromSuperview()
}

func Round(str: NSString) -> String {
    return String(format: "%.1f", (str.floatValue))
}
