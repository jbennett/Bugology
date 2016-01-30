//
//  NetworkOperation.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-30.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public class NetworkOperation: NSOperation {

  private var junk: Bool = false
  override public var finished: Bool {
    get {
      return junk
    }
    set {
      willChangeValueForKey("isFinished")
      junk = newValue
      didChangeValueForKey("isFinished")
    }
  }

  let incomingData = NSMutableData()
  var sessionTask: NSURLSessionTask?
  var localURLSession: NSURLSession {
    return NSURLSession(configuration: localConfig, delegate: self, delegateQueue: nil)
  }
  var localConfig: NSURLSessionConfiguration {
    return NSURLSessionConfiguration.defaultSessionConfiguration()
  }

  public override func start() {
    guard !cancelled else {
      finished = true
      return
    }
    guard let url = NSURL(string: "aURL") else {
      fatalError("Failed to build URL")
    }

    let request = NSURLRequest(URL: url)
    sessionTask = localURLSession.dataTaskWithRequest(request)
    sessionTask!.resume()
  }

  func processData() {
    // implement in subclass
  }

}

extension NetworkOperation: NSURLSessionDelegate, NSURLSessionDataDelegate {

  public func URLSession(session: NSURLSession,
              dataTask: NSURLSessionDataTask,
              didReceiveResponse response: NSURLResponse,
                                 completionHandler: (NSURLSessionResponseDisposition) -> Void) {
    guard !cancelled else {
      finished = true
      sessionTask?.cancel()
      return
    }

    // TODO: handle error codes etc
    completionHandler(.Allow)
  }

  public func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
    guard !cancelled else {
      finished = true
      sessionTask?.cancel()
      return
    }

    incomingData.appendData(data)
  }

  public func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
    guard !cancelled else {
      finished = true
      sessionTask?.cancel()
      return
    }

    if let error = error {
      print("failed to receive response: \(error)")
      finished = true
    } else {
      processData()
      finished = true
    }
  }

}
