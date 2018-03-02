//
//  BaseNavigationController.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import UIKit

protocol Themeable {
  
  var navigationBarBackgroundColor: UIColor? { get }
  var navigationBarTintColor: UIColor? { get }
}

class BaseNavigationController: UINavigationController {
  
  // MARK: - Properties
  
  var defaultNavBarBackgroundColor: UIColor = .white
  var defaultNavBarTintColor: UIColor = .black
  var hideBackButtonText: Bool = true
  
  // MARK: - Private
  
  private var backButtonTextCache = [UIViewController: String?]()
  
  // MARK: - Lifecycle
  required convenience init() {
    self.init(navigationBarClass: nil, toolbarClass: nil)
    self.navigationBar.shadowImage = UIImage()
    self.navigationBar.tintColor = Colors.TTBGBlue
  }
  
  // MARK: - Navigation
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    
    self.cacheTitleAndHide()
    let root = (self.viewControllers.isEmpty)
    self.styleViewController(viewController: viewController, root: root)
    super.pushViewController(viewController, animated: animated)
  }
  
  override func popViewController(animated: Bool) -> UIViewController? {
    
    let destinationVC = self.viewControllers.dropLast().last
    let root = (self.viewControllers.dropLast().count == 1)
    self.uncacheTitleAndShow(viewController: destinationVC)
    self.styleViewController(viewController: destinationVC, root: root)
    return super.popViewController(animated: animated)
    
  }
  
  // MARK: - Styling
  
  private func styleViewController(viewController: UIViewController?, root: Bool) {
    
    if let vc = viewController as? Themeable {
      
      let backgroundColor = vc.navigationBarBackgroundColor ?? self.defaultNavBarBackgroundColor
      self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
      self.navigationBar.barTintColor = backgroundColor
      self.navigationBar.isTranslucent = true
      self.navigationBar.tintColor = vc.navigationBarTintColor ?? self.defaultNavBarTintColor
    }
  }
  
  // MARK: - Back Button
  
  private func cacheTitleAndHide() {
    guard self.hideBackButtonText else { return }
    if let vc = self.viewControllers.last {
      self.backButtonTextCache[vc] = vc.title
      vc.title = ""
    }
  }
  
  private func uncacheTitleAndShow(viewController: UIViewController?) {
    guard self.hideBackButtonText else { return }
    guard
      let vc = viewController,
      let cachedTitle = self.backButtonTextCache[vc]
      else { return }
    vc.title = cachedTitle
    self.backButtonTextCache[vc] = nil
  }
}
