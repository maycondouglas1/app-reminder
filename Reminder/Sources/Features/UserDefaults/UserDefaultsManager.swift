//
//  UserDefaultsManager.swift
//  Reminder
//
//  Created by Maycon Matias on 16/01/26.
//

import Foundation

class UserDefaultsManager {
    private static let userKey = "userKey"
    
    static func saveUser(user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            UserDefaults.standard.set(encoded, forKey: userKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func loadUser() -> User? {
        guard let userData = UserDefaults.standard.data(forKey: userKey) else { return nil }
        let decoder = JSONDecoder()
        
        return try? decoder.decode(User.self, from: userData)
    }
    
    static func removeUser() {
        UserDefaults.standard.removeObject(forKey: userKey)
        UserDefaults.standard.synchronize()
    }
}
