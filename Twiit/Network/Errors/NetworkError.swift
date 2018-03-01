//
//  NetworkErros.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation

enum NetworkError: Range<Int> {

  /// Default
  case noInternet = -1

  // (400...409)
  case isClientError = (400...409)

  // (500...599)
  case isServerError = (500...599)

  // (300...399)
  case isRedirection = (300...399)

  

  var description: String {

    switch self {

    case .isRedirection:
      return ""
    case .isClientError:
      return "Operation unathorized"

    case .isServerError:
      return "Access dinied"

    default:
      return "No internet access"
    }
  }

}
