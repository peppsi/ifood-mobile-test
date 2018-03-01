//
//  TweetMessage.swift
//  Twiit
//
//  Created by Guilherme Coelho on 3/1/18.
//  Copyright © 2018 Guilherme Coelho. All rights reserved.
//

import Foundation

struct TweetMessage:Decodable {
  var id: Int
  var text: String
  var lang: String
}

extension TweetMessage {
  enum CodingKeys : String, CodingKey {
    // Redudant, but gives more control
    case id = "id"
    case text = "text"
    case lang = "lang"
  }
}

extension TweetMessage: Equatable {
  static func == (lhs: TweetMessage, rhs: TweetMessage) -> Bool {
    return lhs.id == rhs.id && lhs.text == rhs.text && lhs.lang == rhs.lang
  }
}
