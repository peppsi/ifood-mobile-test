//
//  SecurityManager.swift
//  Nexer
//
//  Created by Guilherme Coelho on 2/28/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import UIKit

final class SecurityManager {
  
  // MARK: - Properties
  
  let salt = [AppDelegate.self, NSObject.self, NSString.self]
  
  var o:Obfuscator
  
  // Init
  
  private init() {
    
    o = Obfuscator(withSalt: salt)
    
  }
  
  // MARK: Shared Instance
  
  static let shared: SecurityManager = {
    let instance = SecurityManager()
    // setup code
    return instance
  }()
  
  // MARK: - Obfuscator
  
  public func obfuscate(message:String) -> [UInt8] {
    
    let bytes = o.bytesByObfuscatingString(string: message)
    
    return bytes
  }
  
  public func reveal(bytes: [UInt8]) -> String {
    
    let value = o.reveal(key: bytes)
    
    return value
  }

  
  // MARK: - Public Methods

  public func detectSecurityIssues() {
    
    if detectJailBrake() {
      dump("Device is compromised")
      self.deleteAppData()
    }
    
  }
  
  // MARK: - Private Methods

  /// Check for JailBreak
  private func detectJailBrake() -> Bool {
    
    if TARGET_IPHONE_SIMULATOR != 1 {
      // Check 1 : existence of files that are common for jailbroken devices
      if FileManager.default.fileExists(atPath: "/Applications/Cydia.app")
        || FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib")
        || FileManager.default.fileExists(atPath: "/bin/bash")
        || FileManager.default.fileExists(atPath: "/usr/sbin/sshd")
        || FileManager.default.fileExists(atPath: "/etc/apt")
        || FileManager.default.fileExists(atPath: "/private/var/lib/apt/")
        || UIApplication.shared.canOpenURL(URL(string:"cydia://package/com.example.package")!) {
        
        return true
      }
      // Check 2 : Reading and writing in system directories (sandbox violation)
      let stringToWrite = "Jailbreak Test"
      
      do {
        try stringToWrite.write(toFile:"/private/JailbreakTest.txt", atomically:true, encoding:String.Encoding.utf8)
        //Device is jailbroken
        return true
      } catch {
        return false
      }
    } else {
      return false
    }
  }
  
  /// Detele user data
  
  private func deleteAppData() {
    
    // Delete UserDefaults
    resetDefaults()
    dump("Deleted UserDefaults")

    // Delete Keychain
    resetKeychain()
    dump("Deleted Keychain")

  }
  
  private func resetKeychain() {
    
    deleteAllKeysForSecClass(kSecClassGenericPassword)
    deleteAllKeysForSecClass(kSecClassInternetPassword)
    deleteAllKeysForSecClass(kSecClassCertificate)
    deleteAllKeysForSecClass(kSecClassKey)
    deleteAllKeysForSecClass(kSecClassIdentity)
    
  }
  
  private func deleteAllKeysForSecClass(_ secClass: CFTypeRef) {
    let dict: [NSString : Any] = [kSecClass : secClass]
    let result = SecItemDelete(dict as CFDictionary)
    assert(result == noErr || result == errSecItemNotFound, "Error deleting keychain data (\(result))")
  }
  
  private func resetDefaults() {
    let defaults = UserDefaults.standard
    let dictionary = defaults.dictionaryRepresentation()
    dictionary.keys.forEach { key in
      defaults.removeObject(forKey: key)
    }
  }
  
  
}
