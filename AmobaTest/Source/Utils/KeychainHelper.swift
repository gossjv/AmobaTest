//
//  KeychainHelper.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 28/02/2022.
//

import Foundation

@objcMembers
class KeychainHelper: NSObject {
    
    @objc enum Key: Int, CustomStringConvertible {
        
        case token
        
        var description: String {
            switch self {
            case .token: return "token"
            }
        }
    }
    
    @discardableResult
    func add(value: String,
             key: Key) -> Bool {
        guard let valueData = value.data(using: .utf8) else {
            return false
        }
        
        return add(valueData, key)
    }
    
    /// Add/Update key-value
    @discardableResult
    func add(_ value: Data,
             _ key: Key) -> Bool {
        
        var query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.description
        ] as [String: Any]
        
        var resultCode: OSStatus
        
        if let _ = get(key) {
            let updateQuery = [kSecValueData: value] as [String: Any]
            resultCode = SecItemUpdate(query as CFDictionary, updateQuery as CFDictionary)
        } else {
            query[kSecValueData as String] = value
            resultCode = SecItemAdd(query as CFDictionary, nil)
        }
        
        return resultCode == noErr
    }
    
    func get(_ key: Key) -> String? {
        let queryLoad = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.description,
            kSecReturnData: kCFBooleanTrue as Any,
            kSecMatchLimit: kSecMatchLimitOne
        ] as [String: Any]
        
        var result: AnyObject?
        
        let resultCodeLoad = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(queryLoad as CFDictionary, UnsafeMutablePointer($0))
        }
        
        if resultCodeLoad == noErr {
            if let result = result as? Data,
               let value = String(data: result, encoding: .utf8) {
                return value
            }
        }
        
        return nil
    }
    
    @discardableResult
    func delete(_ key: Key) -> Bool {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key.description
        ] as [String: Any]
        
        let resultCode = SecItemDelete(query as CFDictionary)
        return resultCode == noErr
    }
    
}



