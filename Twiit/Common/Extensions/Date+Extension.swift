//
//  Date+Extension.swift
//  Twiit
//
//  Created by Guilherme Coelho on 2/9/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation

extension Date {
  
  static func formattedStringFrom(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd MMMM"
    dateFormatter.timeZone = TimeZone(identifier: "US/Central") ?? TimeZone.current
    return dateFormatter.string(from: date)
  }
}
