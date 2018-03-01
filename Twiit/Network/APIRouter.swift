//
//  APIRouter.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
  
  // Rest calls
  
  case tweets
  //case weatherCondition(cityId:String, year:String)
  
  // MARK: - Method
  
  private var method: HTTPMethod {
    
    switch self {
      
    // Only GET
    case .tweets:
      return .get
      
    }
  }
  
  // MARK: - Path
  
  private var path: String {
    
    switch self {
      
    case .tweets:
      return "\(BaseURLs.googleUrl)/cities/"

//    case .weatherCondition(let id, let year):
//      return "\(BaseURL.url)/cities/\(id)/year/\(year)"
    }
  }
  
  // MARK: - URL Request
  
  func asURLRequest() throws -> URLRequest {
    
    // Base URL + path
    
    let url = URL(string: path)
    
    #if DEBUG
      print("URL: \(url!)")
    #endif
    
    var urlRequest = URLRequest(url: url!)
    
    // HTTP Method
    
    urlRequest.httpMethod = method.rawValue
    
    // Headers
    
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
    urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    
    return urlRequest
  }
  
}
