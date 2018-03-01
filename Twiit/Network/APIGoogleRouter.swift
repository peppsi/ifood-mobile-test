//
//  APIRouter.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Moya

enum APIGoogleRouter: TargetType {

  // Property

  case analyze

  var path: String {

    switch self {

    case .analyze:
      return "\(BaseURLs.ttUrl)/documents:analyzeSentiment"
    }

  }

  var method: Moya.Method {
    switch self {
    case .checkStatus:
      return .post
    }
  }

  var sampleData: Data { return "".utf8Encoded }

  var task: Task {
    switch self {
    case .checkStatus(let text):
      return .requestCompositeParameters(
        bodyParameters: [ "document": [ "type": "PLAIN_TEXT", "content": "\(text)"], "encodingType": "UTF8" ],
        bodyEncoding: JSONEncoding.default,
        urlParameters: ["key": "\(GoogleEnviroment.apiKey)"])
    }
  }

  var headers: [String : String]? {
    switch self {
    case .checkStatus:
      return ["Content-type": "application/json"]
    }
  }
}

private extension String {

  var urlEscaped: String {
    return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
  }

  var utf8Encoded: Data {
    return data(using: .utf8)!
  }

}

