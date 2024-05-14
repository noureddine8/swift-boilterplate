//
//  KeychainService.swift
//  Boilerplate
//
//  Created by Noureddine Louafi on 14/5/2024.
//

import Foundation
import Security

protocol KeychainServiceProtocol {
    func saveValue(_ value: String, forKey key: String) -> Bool
    
    func getValue(forKey key: String) -> String?
    
    func deleteValue(forKey key: String) -> Bool
}

class KeychainService: KeychainServiceProtocol {
    static let jwtKey: String = "JWT_KEY"
    
    private let service: String
    
    init(service: String) {
        self.service = service
    }
    
    func saveValue(_ value: String, forKey key: String) -> Bool {
        guard let data = value.data(using: .utf8) else { return false }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status == errSecSuccess
    }
    
    func getValue(forKey key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecReturnData as String: true
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status == errSecSuccess, let data = result as? Data else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func deleteValue(forKey key: String) -> Bool {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        return status == errSecSuccess
    }
}
