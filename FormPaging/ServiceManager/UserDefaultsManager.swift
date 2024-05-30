//
//  UserDefaultManager.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import Foundation
import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private let userDefaults = UserDefaults.standard
    
    private enum Keys {
        static let userEmail = "userEmail"
        static let userPassword = "userPassword"
        static let isLoggedIn = "isLoggedIn"
    }
    
    func saveUser(email: String, password: String) {
        userDefaults.set(email, forKey: Keys.userEmail)
        userDefaults.set(password, forKey: Keys.userPassword)
    }
    
    func getUser() -> (email: String?, password: String?) {
        let email = userDefaults.string(forKey: Keys.userEmail)
        let password = userDefaults.string(forKey: Keys.userPassword)
        return (email, password)
    }
    
    func setLoggedIn(_ loggedIn: Bool) {
        userDefaults.set(loggedIn, forKey: Keys.isLoggedIn)
    }
    
    func isLoggedIn() -> Bool {
        return userDefaults.bool(forKey: Keys.isLoggedIn)
    }
    
    func logout() {
        userDefaults.set(false, forKey: Keys.isLoggedIn)
    }
}
