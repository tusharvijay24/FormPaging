//
//  VcSignup.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import UIKit

class VcSignup: UIViewController {
    
    @IBOutlet weak var txtEmail: TfApp!
    @IBOutlet weak var txtPassword: TfApp!
    @IBOutlet weak var btnSignUp: BtnApp!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var btnLogin: UIButton!
    
    private var isPasswordVisible: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigUI()
    }
    
    @IBAction func didTapSignUp(_ sender: Any) {
        if validateFields() {
            guard let email = txtEmail.text, let password = txtPassword.text else { return }
            UserDefaultsManager.shared.saveUser(email: email, password: password)
            UserDefaultsManager.shared.setLoggedIn(true)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func didTapLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension VcSignup {
    func ConfigUI() {
        let btnEye = UIButton(type: .custom)
        btnEye.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        btnEye.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: -10.0, bottom: 0.0, right: 10.0)
        btnEye.setImage(UIImage(named: "hiddenEye"), for: .normal)
        btnEye.addTarget(self, action: #selector(togglePasswordVisibility(_:)), for: .touchUpInside)
        txtPassword.rightView = btnEye
        txtPassword.rightViewMode = .always
        let account = "Already have an account? - "
        let signup = "Login"
        let attributedString = NSMutableAttributedString(string: account)
        let aboutAttributedString = NSAttributedString(string: signup, attributes: [NSAttributedString.Key.foregroundColor: AppTheme.colorBlue.setColor()])
        attributedString.append(aboutAttributedString)
        lblLogin.attributedText = attributedString
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
