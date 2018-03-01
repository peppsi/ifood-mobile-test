//
//  String+Extensions.swift
//  Twiit
//
//  Created by Guilherme Coelho on 2/9/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation

extension String {
  
  static func convertStrToDate(dateStr: String) -> Date {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.timeZone = NSTimeZone.local
    
    if dateStr != "" {
      return dateFormatter.date(from: dateStr) ?? Date()
    }else{
      return Date(timeIntervalSince1970: 0)
    }
  }
  
}
