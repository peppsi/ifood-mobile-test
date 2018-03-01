//
//  APIResult.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation

protocol APIResult {

  case success(Data)
  case failure(NetworkError)

}
