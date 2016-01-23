//
//  BitBucketClient.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-11.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import BrightFutures

public class BitBucketClient: Client {

  public func isAccountValid() -> Future<Bool, NoError> {
    return future(false)
  }

  public func getProjects() -> Future<[Project], NoError> {
    return Promise<[Project], NoError>().future
  }

  public func getIssuesForProject(project: Project) -> Future<[Issue], NoError> {
    return Promise<[Issue], NoError>().future
  }

}
