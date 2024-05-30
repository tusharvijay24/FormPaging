//
//  VcBasic.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import UIKit

class VcBasic: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    var formData = FormDataModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI()  {
        loadData()
        txtTitle.delegate = self
        txtName.delegate = self
        txtMobile.delegate = self
        txtEmail.delegate = self
    }
    
    func loadData() {
        txtTitle.text = formData.title
        txtName.text = formData.name
        txtMobile.text = formData.mobileNumber
        txtEmail.text = formData.email
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        saveData()
    }
    
    func saveData() {
        formData.title = txtTitle.text
        formData.name = txtName.text
        formData.mobileNumber = txtMobile.text
        formData.email = txtEmail.text
    }
}
