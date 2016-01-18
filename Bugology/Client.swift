//
//  Client.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-11.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import BrightFutures

public protocol Client {

  func isAccountValid() -> Future<Bool, NoError>
  func getProjects() -> Future<Project, NoError>

}
