//
//  ViewController.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import UIKit

class VcLogin: UIViewController {
    @IBOutlet weak var txtEmail: TfApp!
    @IBOutlet weak var txtPassword: TfApp!
    @IBOutlet weak var btnLogin: BtnApp!
    @IBOutlet weak var lblSignup: UILabel!
    @IBOutlet weak var btnSignup: UIButton!
    
    private var isPasswordVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigUI()
    }

    @IBAction func didTapLogin(_ sender: Any) {
        if validateFields() {
            guard let email = txtEmail.text, let password = txtPassword.text else { return }
            let savedUser = UserDefaultsManager.shared.getUser()
            if email == savedUser.email && password == savedUser.password {
                UserDefaultsManager.shared.setLoggedIn(true)
                let mainVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "VcHome") as! VcHome
                self.navigationController?.pushViewController(mainVC, animated: true)
            } else {
                Toast.show(message: "Invalid username or password")
            }
        }
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        let signupVC = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "VcSignup") as! VcSignup
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
}

extension VcLogin {
    func ConfigUI() {
        let btnEye = UIButton(type: .custom)
        btnEye.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btnEye.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -10.0, bottom: 0.0, right: 10.0)
        btnEye.setImage(UIImage(named: "hiddenEye"), for: .normal)
        btnEye.addTarget(self, action: #selector(togglePasswordVisibility(_:)), for: .touchUpInside)
        txtPassword.rightView = btnEye
        txtPassword.rightViewMode = .always
        
        let account = "Create an account - "
        let signup = "Sign Up"
        let attributedString = NSMutableAttributedString(string: account)
        let aboutAttributedString = NSAttributedString(string: signup, attributes: [NSAttributedString.Key.foregroundColor: AppTheme.colorBlue.setColor()])
        attributedString.append(aboutAttributedString)
        lblSignup.attributedText = attributedString
    }
    
    @objc func togglePasswordVisibility(_ sender: UIButton) {
        isPasswordVisible = !isPasswordVisible
        txtPassword.isSecureTextEntry = !isPasswordVisible
        let imageName = isPasswordVisible ? "showEye" : "hiddenEye"
        sender.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func validateFields() -> Bool {
        if txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            Toast.show(message: "Please enter username/email")
            return false
        } else if txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == true {
            Toast.show(message: "Please enter password")
            return false
        }
        return true
    }
}
