//
//  Toast.swift
//  Ixkio
//
//  Created by Tushar on 31/07/23.
//

import UIKit

class Toast {

    static func show(message: String) {
        DispatchQueue.main.async {
            guard let window = UIApplication.shared.keyWindow else { return }
            
            let toastContainer = UIView(frame: CGRect())
            toastContainer.backgroundColor = UIColor.black.withAlphaComponent(0.7)
            toastContainer.alpha = 0.0
            toastContainer.layer.cornerRadius = 15
            toastContainer.clipsToBounds  = true
            
            let toastLabel = UILabel(frame: CGRect())
            toastLabel.textColor = UIColor.white
            toastLabel.textAlignment = .center
            toastLabel.font = UIFont.systemFont(ofSize: 16)
            toastLabel.text = message
            toastLabel.clipsToBounds  = true
            toastLabel.numberOfLines = 0
            
            toastContainer.addSubview(toastLabel)
            window.addSubview(toastContainer)
            
            toastLabel.translatesAutoresizingMaskIntoConstraints = false
            toastContainer.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                toastLabel.leadingAnchor.constraint(equalTo: toastContainer.leadingAnchor, constant: 15),
                toastLabel.trailingAnchor.constraint(equalTo: toastContainer.trailingAnchor, constant: -15),
                toastLabel.bottomAnchor.constraint(equalTo: toastContainer.bottomAnchor, constant: -15),
                toastLabel.topAnchor.constraint(equalTo: toastContainer.topAnchor, constant: 15),
                
                toastContainer.leadingAnchor.constraint(equalTo: window.leadingAnchor, constant: 65),
                toastContainer.trailingAnchor.constraint(equalTo: window.trailingAnchor, constant: -65),
                toastContainer.bottomAnchor.constraint(equalTo: window.safeAreaLayoutGuide.bottomAnchor, constant: -95)
            ])
            
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
                toastContainer.alpha = 1.0
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 2.0, options: .curveEaseOut, animations: {
                    toastContainer.alpha = 0.0
                }, completion: {_ in
                    toastContainer.removeFromSuperview()
                })
            })
        }
    }
}
