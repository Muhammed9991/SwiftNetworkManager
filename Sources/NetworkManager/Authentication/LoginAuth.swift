//  LoginAuth.swift
//  Created by Muhammed Mahmood on 20/11/2022.

import Foundation

private let readMe =
"""
Main responsilbilties of this Actor is to:
    - Store token in keychain
    - Store email address in keychain
    - Store password in keychain

Note: this is only ran once at login. Thats why this is in its own Actor.
"""

enum KeychainError: Error {
    // Any operation result status than errSecSuccess
    case unexpectedStatusWithString(String, OSStatus, String)
}

public actor LoginAuth {
    public static let shared = LoginAuth()
    private init() {}
    
    private var username: String?
    private var password: String?
    private var token: String?
    
    private let tokenLocation = "access-token"
    private let usernameLocation = "username"
    private let passwordLocation = "password"
    private let accountLocation = "network-app"
    
    public func saveToken(_ item: Data) async throws {
        
        let query: [String: AnyObject] = [
            
            kSecAttrService as String: tokenLocation as AnyObject,
            kSecAttrAccount as String: accountLocation as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: item as AnyObject,
        ]
        
        let status = SecItemAdd(
            query as CFDictionary,
            nil
        )
        if status != errSecSuccess {
            throw KeychainError.unexpectedStatusWithString( // Possible that its due to permission issues
                "ERROR: ",
                status,
                " Unable to store token in keychain"
            )
        }
    }
    
    public func saveUsername(_ item: Data) async throws {
        
        let query: [String: AnyObject] = [
            
            kSecAttrService as String: usernameLocation as AnyObject,
            kSecAttrAccount as String: accountLocation as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: item as AnyObject,
        ]
        
        let status = SecItemAdd(
            query as CFDictionary,
            nil
        )
        if status != errSecSuccess {
            throw KeychainError.unexpectedStatusWithString(
                "ERROR: ",
                status,
                " Unable to store username in keychain"
            )
        }
    }
    
    public func savePassword(_ item: Data) async throws {
        
        let query: [String: AnyObject] = [
            
            kSecAttrService as String: passwordLocation as AnyObject,
            kSecAttrAccount as String: accountLocation as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: item as AnyObject,
        ]
        
        let status = SecItemAdd(
            query as CFDictionary,
            nil
        )
        if status != errSecSuccess {
            throw KeychainError.unexpectedStatusWithString(
                "ERROR: ",
                status,
                " Unable to store password in keychain"
            )
        }
    }
}
