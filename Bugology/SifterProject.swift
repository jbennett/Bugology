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
  
  public init(name: String) {
    self.name = name
  }
  
  public init(data: [String: AnyObject]) {
    self.name = data["name"] as? String ?? ""
  }
  
}
