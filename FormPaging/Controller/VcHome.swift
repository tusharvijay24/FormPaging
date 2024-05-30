//
//  VcHome.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import UIKit
import SideMenu

class VcHome: UIViewController {

    @IBOutlet weak var vwNav: NavigationView!
    @IBOutlet weak var vwContainer: UIView!
    var sideMenu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        setupSideMenu()
        setupInitialView()
        vwNav.configure(title: "", isLeftButtonHidden: false, isRightButtonHidden: true, leftButtonAction: {
            self.present(self.sideMenu!, animated: true, completion: nil)
        }, rightButtonAction: {
        }, leftIcon: UIImage(named: "hamburger"), rightIcon: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleMenuSelection(_:)), name: NSNotification.Name("MenuSelectionNotification"), object: nil)
    }
    
    private func setupSideMenu() {
        let menuVC = storyboard?.instantiateViewController(withIdentifier: "VcMenu") as! VcMenu
        sideMenu = SideMenuNavigationController(rootViewController: menuVC)
        sideMenu?.leftSide = true
        sideMenu?.setNavigationBarHidden(true, animated: false)
        
        var settings = SideMenuSettings()
        settings.menuWidth = view.frame.width / 2
        settings.presentationStyle = .menuSlideIn
        settings.presentationStyle.presentingEndAlpha = 0.5
        sideMenu?.settings = settings
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    private func setupInitialView() {
        switchToViewController(identifier: "VcBasic")
    }
    
    @objc private func handleMenuSelection(_ notification: Notification) {
        if let menuItem = notification.object as? String {
            switch menuItem {
            case "Basic Details":
                switchToViewController(identifier: "VcBasic")
            case "Address Details":
                switchToViewController(identifier: "VcAddress")
            case "Other Details":
                switchToViewController(identifier: "VcOthers")
            case "LogOut":
                didTapLogout()
            default:
                break
            }
        }
    }
    
    private func switchToViewController(identifier: String) {
        let newViewController = storyboard?.instantiateViewController(withIdentifier: identifier)
        for childVC in children {
            childVC.view.removeFromSuperview()
            childVC.removeFromParent()
        }
        if let newVC = newViewController {
            addChild(newVC)
            vwContainer.addSubview(newVC.view)
            newVC.view.frame = vwContainer.bounds
            newVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            newVC.didMove(toParent: self)
        }
    }
    
    private func didTapLogout() {
        UserDefaultsManager.shared.logout()
        FormDataModel.shared.clear()
        APPDELEGATE.RedirectUser()
    }
    
}
