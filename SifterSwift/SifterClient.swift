//
//  SifterClient.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-06.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public class SifterClient {

  public let domain: String
  public let token: String

  public init(domain: String, token: String) {
    self.domain = domain
    self.token = token
  }

  public var baseURL: NSURL {
    return NSURL(string: "https://\(domain).sifterapp.com/api/")!
  }

  public var sessionConfiguration: NSURLSessionConfiguration {
    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    configuration.HTTPAdditionalHeaders = [
      "X-Sifter-Token": token
    ]

    return configuration
  }

}
