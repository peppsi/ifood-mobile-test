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
  
  static let ttUrl = "https://api.twitter.com"
  static let ttUrl1 = "https://api.twitter.com/1.1"

  static let googleUrl = "https://language.googleapis.com/v1"

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
  
  static let TTBGBlue = UIColor(hexString: "c0deed")
  
  static let TTDarkBlue = UIColor(hexString: "0084b4")

  static let TTLightBlue = UIColor(hexString: "1dcaff")

}
