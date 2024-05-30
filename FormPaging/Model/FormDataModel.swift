//
//  FormDataModel.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import Foundation

class FormDataModel {
    static let shared = FormDataModel()
    
    var title: String?
    var name: String?
    var mobileNumber: String?
    var email: String?
    var permanentAddress: String?
    var correspondenceAddress: String?
    var fatherName: String?
    var motherName: String?
    var occupation: String?
    
    private init() {}
    
    func clear() {
        title = nil
        name = nil
        mobileNumber = nil
        email = nil
        permanentAddress = nil
        correspondenceAddress = nil
        fatherName = nil
        motherName = nil
        occupation = nil
    }
}
