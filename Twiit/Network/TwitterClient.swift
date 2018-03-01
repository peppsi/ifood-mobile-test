//
//  APIClient.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import Alamofire

class TwitterClient {
  
  ///
  /// Generic Alamofire request
  /// Returns: Result<T>
  ///
  
  @discardableResult
  private static func performRequest<T:Decodable>(route:TwitterRouter,
                                                  decoder: JSONDecoder = JSONDecoder(),
                                                  completion:@escaping (Result<T>) -> Void)
    -> DataRequest {
    
    return Alamofire.request(route)
      .responseJSONDecodable (decoder: decoder) { (response: DataResponse<T>) in
        completion(response.result)
    }
  }
  
  // MARK: - API Calls
  
  static func authorize(completion:@escaping (Result<[TweetMessage]>) -> Void) {
    
    performRequest(route: TwitterRouter.authorize,
                   completion: completion)
    
  }
  
  static func getWeatherConditioFor(cityId:String,
                                    year:String,
                                    completion:@escaping (Result<[TweetMessage]>) -> Void) {
    
//
//    performRequest(route: APIRouter.weatherCondition(cityId: cityId, year: year),
//                   completion: completion)
  }
  
}
