//
//  UserManager.swift
//  AppleLoginExample
//
//  Created by 张行 on 2019/9/20.
//  Copyright © 2019 张行. All rights reserved.
//

import Foundation

@propertyWrapper
struct UserDefaultProperty<V> {
    let key:String
    let `default`:V
    var wrappedValue:V {
        get {
            UserDefaults.standard.object(forKey: self.key) as? V ?? self.default
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
        }
    }
}

class UserManager {
    
    struct UserManagerKey {
        static let manager = UserManager()
    }
    
    static func manager() -> UserManager {
        return UserManagerKey.manager
    }
    
    @UserDefaultProperty(key: "isLogin", default: false)
    var isLogin:Bool
}
