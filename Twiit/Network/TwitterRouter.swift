//
//  APIRouter.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Alamofire

enum TwitterRouter: URLRequestConvertible {

  case authorize
  case retrieveTweets(user: String, lastId: Int?)

}

extension TwitterRouter: TargetType {

  var path: String {
    switch self {
    case .authorize:
      return "\(BaseURLs.ttUrl)/oauth2/token"
    case .retrieveTweets:
      return "\(BaseURLs.ttUrl1)/statuses/user_timeline.json"
    }
  }

  var method: HTTPMethod {
    switch self {

    case .authorize:
      return .post

    case .retrieveTweets:
      return .get
    }
  }

  // MARK: - Headers

  var authorization: String {
    switch self {

    case .authorize:
      return  "Basic \(TwitterEnviroment.basicToken)"

    case .retrieveTweets:
      return "Bearer \(TwitterEnviroment.bearerToken)"
    }
  }

  var contentType: String  {
    switch self {

    case .authorize:
      return "application/x-www-form-urlencoded;charset=UTF-8"

    case .retrieveTweets:
      return "application/json"
    }
  }

  // MARK: - Request


  public func asURLRequest() throws -> URLRequest {

    let parameters: [String: Any] = {
      switch self {

      case .authorize:
        return ["grant_type": "client_credentials"]

      case .retrieveTweets(let user, let lastId):

        var dict: [String: Any] = [:]

        dict["screen_name"] = user
        dict["max_id"] = lastId

        return dict

      default:
        return [:]
      }

    }()

    let url = self.path

    var request = URLRequest(url: url)

    request.httpMethod = method.rawValue

    request.setValue(self.authorization,
                     forHTTPHeaderField: "Authorization")

    request.setValue(self.contentType,
                     forHTTPHeaderField: "Authorization")

    request.timeoutInterval = TimeInterval(10 * 1000)

    return try URLEncoding.default.encode(request, with: parameters)
  }

}
