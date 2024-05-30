//
//  VcOthers.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import UIKit

class VcOthers: UIViewController {
    
    @IBOutlet weak var txtFatherName: UITextField!
    @IBOutlet weak var txtMotherName: UITextField!
    @IBOutlet weak var txtOccupation: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    var formData = FormDataModel.shared
    let occupations = ["Doctor", "Engineer", "Teacher", "Other"]
    var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI()  {
        txtFatherName.delegate = self
        txtMotherName.delegate = self
        setupPickerView()
        loadData()
    }
    
    func setupPickerView() {
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        toolbar.setItems([doneButton], animated: false)
        
        txtOccupation.inputView = pickerView
        txtOccupation.inputAccessoryView = toolbar
    }
    
    func loadData() {
        txtFatherName.text = formData.fatherName
        txtMotherName.text = formData.motherName
        txtOccupation.text = formData.occupation
        if let occupation = formData.occupation, let index = occupations.firstIndex(of: occupation) {
            pickerView.selectRow(index, inComponent: 0, animated: false)
        }
    }
    
    func saveData() {
        formData.fatherName = txtFatherName.text
        formData.motherName = txtMotherName.text
        formData.occupation = txtOccupation.text
    }
    
    @IBAction func didTapSubmitData(_ sender: UIButton) {
        saveData()
        ShowActivityIndicator(uiView: self.view)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            HideActivityIndicator(uiView: self.view)
            showAlertWithOutCancel(on: self, title: "Data Submitted", message: "Your data has been submitted successfully on server.", buttonTitle: "OK") {
                APPDELEGATE.RedirectUser()
            }
        }
    }

    
    @objc func doneTapped() {
        txtOccupation.resignFirstResponder()
    }
}

extension VcOthers: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return occupations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return occupations[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtOccupation.text = occupations[row]
        saveData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        saveData()
    }
}
