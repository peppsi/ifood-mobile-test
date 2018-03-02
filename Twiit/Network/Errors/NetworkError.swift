//
//  NetworkErros.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation

enum NetworkError {
  
  /// Default
  case noInternet

  // (400...409)
  case isClientError

  // (500...599)
  case isServerError

  // (300...399)
  case isRedirection

  // MARK: - Get NetworkError

  func error(int:Int) -> NetworkError {

    switch int {

    case (300...399):
      return .isRedirection

    case (400...409):
      return .isClientError

    case (500...599):
      return .isServerError

    default:
      return .noInternet
    }

  }

  // MARK: - Get Description

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
