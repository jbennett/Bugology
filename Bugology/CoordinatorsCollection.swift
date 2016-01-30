//
//  CoordinatorsCollection.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public class CoordinatorsCollection {

  var coordinators = [AnyObject]()

  public init() {}

  public func addCoordinator(coordinator: AnyObject) {
    coordinators.append(coordinator)
  }

  public func removeCoordinator(coordinator: AnyObject) {
    coordinators = coordinators.filter { $0 !== coordinator }
  }

}
