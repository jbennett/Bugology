//
//  SifterIssue.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-23.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public struct SifterIssue: Issue {

  public let name: String
  public let category: String?
  public let status: String?

  public init(data: [String: AnyObject]) throws {
    self.name = data["subject"] as? String ?? ""
    self.category = data["category_name"] as? String
    self.status = data["status"] as? String
  }

}
