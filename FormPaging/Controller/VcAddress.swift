//
//  VcAddess.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import UIKit

class VcAddress: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var txtPermanentAddress: UITextField!
    @IBOutlet weak var txtCorrespondenceAddress: UITextField!
    
    var formData = FormDataModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configUI()
    }
    
    func configUI() {
        txtPermanentAddress.text = formData.permanentAddress
        txtCorrespondenceAddress.text = formData.correspondenceAddress
        txtPermanentAddress.delegate = self
        txtCorrespondenceAddress.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveData()
    }
    
    func saveData() {
        formData.permanentAddress = txtPermanentAddress.text
        formData.correspondenceAddress = txtCorrespondenceAddress.text
    }
}
