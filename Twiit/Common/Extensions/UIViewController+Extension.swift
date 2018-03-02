//
//  UIViewController+Extension.swift
//  Twiit
//
//  Created by Guilherme Coelho on 2/8/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import UIKit

// MARK: UIViewController Extension
extension UIViewController {
  
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }

  func hideNavigationBar(){
    // Hide the navigation bar on the this view controller
    self.navigationController?.setNavigationBarHidden(true, animated: true)

  }

  func showNavigationBar() {
    // Show the navigation bar on other view controllers
    self.navigationController?.setNavigationBarHidden(false, animated: true)
  }

}
