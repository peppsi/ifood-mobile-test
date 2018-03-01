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
  
}
