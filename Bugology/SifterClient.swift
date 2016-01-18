//
//  SifterClient.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-11.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import BrightFutures

public class SifterClient: Client {

  var sessionClass: NSURLSession.Type = NSURLSession.self // testing seam
  let account: Account
  let domain: String
  let token: String
  let baseURL: NSURL

  public init(account: Account) {
    self.account = account
    self.domain = account.domain ?? ""
    self.token = account.token ?? ""
    self.baseURL = NSURL(string: "https://\(domain).sifterapp.com/api/")!
  }

  lazy var session: NSURLSession = {
    let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
    configuration.HTTPAdditionalHeaders = [
      "X-Sifter-Token": self.token,
      "Accept": "application/json"
    ]
    return self.sessionClass.init(configuration: configuration)
  }()

  func urlForResource(resource: String) -> NSURL {
    return baseURL.URLByAppendingPathComponent(resource)
  }

  public func isAccountValid() -> Future<Bool, NoError> {
    let promise = Promise<Bool, NoError>()
    let url = urlForResource("priorities")
    let task = session.dataTaskWithURL(url) { data, response, error in
      if let response = response as? NSHTTPURLResponse where response.statusCode == 200 {
        promise.success(true)
      } else {
        promise.success(false)
      }
    }
    task.resume()

    return promise.future
  }
  
  public func getProjects() -> Future<Project, NoError> {
    return Promise<Project, NoError>().future
  }
}
