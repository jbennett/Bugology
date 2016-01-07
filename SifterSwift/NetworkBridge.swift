//
//  NetworkBridge.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-06.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public protocol NetworkBridge {

  init(configuration: NSURLSessionConfiguration)

  func dataTaskWithRequest(request: NSURLRequest, completionHandler: (NSData?, NSURLResponse?, NSError?) -> Void) -> NSURLSessionDataTask

}

extension NSURLSession : NetworkBridge {}
