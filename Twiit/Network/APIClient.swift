//
//  APIClient.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
  
  ///
  /// Generic Alamofire request
  /// Returns: Result<T>
  ///
  
  @discardableResult
  private static func performRequest<T:Decodable>(route:APIRouter,
                                                  decoder: JSONDecoder = JSONDecoder(),
                                                  completion:@escaping (Result<T>) -> Void)
    -> DataRequest {
    
    return Alamofire.request(route)
      .responseJSONDecodable (decoder: decoder) { (response: DataResponse<T>) in
        completion(response.result)
    }
  }
  
  // MARK: - API Calls
  
  static func getCities(completion:@escaping (Result<[TweetMessage]>) -> Void) {
    
    performRequest(route: APIRouter.tweets,
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
