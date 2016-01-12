//
//  GitHubClient.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-11.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import BrightFutures

public class GitHubClient: Client {

  public func isAccountValid() -> Future<Bool, NoError> {
    return future(false)
  }

}