//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 11.06.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults.standard
    private let userDataKey = "userManager"
    
    private init() {}
    
    func saveUser(user: User) {
        guard let userDate = try? JSONEncoder().encode(user) else { return }
        userDefaults.set(userDate, forKey: userDataKey)
    }
    
    func loadUser() -> User {
        guard let userData = userDefaults.object(forKey: userDataKey) as? Data else { return User() }
        guard let user = try? JSONDecoder().decode(User.self, from: userData) else { return User() }
        return user
    }
    
    func clear(userManager: UserManager) {
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userDefaults.removeObject(forKey: userDataKey)
    }
}
