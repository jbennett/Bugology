//
//  SifterProject.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-20.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public struct SifterProject: Project {

  public let name: String
  public let apiURL: NSURL
  public let issuesURL: NSURL

  public init(name: String, apiURL: NSURL, issuesURL: NSURL) {
    self.name = name
    self.apiURL = apiURL
    self.issuesURL = issuesURL
  }

  public init(data: [String: AnyObject]) throws {
    guard let apiURLString = data["api_url"] as? String,
      apiURL = NSURL(string: apiURLString),
      issuesURLString = data["api_issues_url"] as? String,
      issuesURL = NSURL(string: issuesURLString) else {
        throw NSError(domain: "com.jbennett.parseError", code: 1, userInfo: nil)
    }

    self.name = data["name"] as? String ?? ""
    self.apiURL = apiURL
    self.issuesURL = issuesURL
  }

}
