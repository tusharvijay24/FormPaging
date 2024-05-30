//
//  NavigationView.swift
//  MyUI
//
//  Created by Apple on 02/08/23.
//
import UIKit

class NavigationView: UIView {
    @IBOutlet weak var vwContent: UIView!
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet var btnProfile: UIButton!
    @IBOutlet var btnSideMenu: UIButton!
    @IBOutlet weak var imgRight: UIImageView!

    typealias ButtonAction = () -> Void

    var leftButtonAction: ButtonAction?
    var rightButtonAction: ButtonAction?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {

        Bundle.main.loadNibNamed("NavigationView", owner: self, options: nil)
        addSubview(vwContent)
        vwContent.frame = self.bounds
        vwContent.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        btnProfile.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        btnSideMenu.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }

    func configure(title: String?, isLeftButtonHidden: Bool, isRightButtonHidden: Bool, leftButtonAction: ButtonAction?, rightButtonAction: ButtonAction?, leftIcon: UIImage?, rightIcon: UIImage?) {

        self.leftButtonAction = leftButtonAction
        self.rightButtonAction = rightButtonAction

        imgLeft.isHidden = isLeftButtonHidden
        imgRight.isHidden = isRightButtonHidden
        
        // Set icons if provided, or use default icons
        imgLeft.image = leftIcon
        imgRight.image = rightIcon ?? UIImage(named: "sidebar")
    }


    @objc private func leftButtonTapped() {
        leftButtonAction?()
    }

    @objc private func rightButtonTapped() {
        rightButtonAction?()
    }
}
extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.filter({ $0.isKind(of: ofClass) }).last {
            popToViewController(vc, animated: animated)
        }
    }
}

