//
//  User.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import Foundation

struct User {
    static var userName: String = ""
    static var repoName: String = ""
    static var accessToken: String = ""
    static let userDefaults = UserDefaults.standard
    
    static func saveUser() {
        userDefaults.set(User.userName, forKey: "userName")
        userDefaults.set(User.repoName, forKey: "repoName")
        userDefaults.set(User.accessToken, forKey: "accessToken")
    }
    static func loadUser() {
        User.userName = userDefaults.string(forKey: "userName")!
        User.repoName = userDefaults.string(forKey: "repoName")!
        User.accessToken = userDefaults.string(forKey: "accessToken")!
    }
    static func clearUser() {
        userDefaults.removeObject(forKey: "userName")
        userDefaults.removeObject(forKey: "repoName")
        userDefaults.removeObject(forKey: "accessToken")
    }
}
