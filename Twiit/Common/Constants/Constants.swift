//
//  Constants.swift
//  Twiit
//
//  Created by Guilherme Coelho on 2/8/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import UIKit

enum BaseURLs {
  
  static let ttUrl = "http://localhost:8882"
  static let googleUrl = "http://localhost:8882"

}

enum HTTPHeaderField: String {
  
  case authentication = "Authorization"
  case contentType = "Content-Type"
  case acceptType = "Accept"
  case acceptEncoding = "Accept-Encoding"
  
}

enum ContentType: String {
  
  case json = "application/json"
}

enum Colors {
  
  static let TTBlue = UIColor(hexString: "80CBC4")
  
  static let TTLightGray = UIColor(hexString: "F0F0F0")

  static let TTRed = UIColor(hexString: "F0F0F0")


}
