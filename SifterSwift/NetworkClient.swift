//
//  NetworkClient.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-06.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import BrightFutures
import Result

typealias JSON = [String: AnyObject]

public class NetworkClient {

  var baseURL: NSURL
  var bridge: NetworkBridge = NSURLSession.sharedSession()

  public init(baseURL: NSURL) {
    self.baseURL = baseURL
  }

  func URLForResource(resource: String) -> NSURL {
    return baseURL.URLByAppendingPathComponent(resource)
  }

  func getResource(path: String) -> Future<NSData, NSError> {
    let promise = Promise<NSData, NSError>()

    let request = NSURLRequest(URL: URLForResource(path))
    let task = bridge.dataTaskWithRequest(request) { data, response, error in
      guard error == nil else {
        promise.failure(error!)
        return
      }

      promise.success(data!)
    }
    task.resume()

    return promise.future
  }

  func getJSONResource(resource: String) -> Future<JSON, NSError> {
    return getResource(resource).flatMap(self.parseJSON)
  }

  private func parseJSON(data: NSData) -> Result<JSON, NSError> {
    do {
      if let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSON {
        return .Success(json)
      } else {
        return .Failure(NSError(domain: "asdf", code: 1, userInfo: nil)) // TODO: correct this
      }
    } catch let error as NSError {
      return .Failure(error)
    }
  }

}
