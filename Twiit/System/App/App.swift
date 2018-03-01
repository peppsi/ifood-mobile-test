//
//  App.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import UIKit

class App {
  
  // MARK: - Dependencies
  
  private let window: UIWindow
  
  lazy var coordinator: AppCoordinator = AppCoordinator(
    window: self.window,
    navigationController: BaseNavigationController(),
    application: self
  )
  
  // MARK: - Lifecycle
  
  init(window: UIWindow) {
    self.window = window
    
    #if DEBUG
      print("DEBUG MODE")
    #endif

    checkSecurityIssues()
  }

  // MARK: - Private

  private func checkSecurityIssues() {

    // Check if device is compromised
    // If true delete all sensible data from device
    SecurityManager.shared.detectSecurityIssues()

  }
  
}
