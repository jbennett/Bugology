//
//  Issue.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-23.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public protocol Issue {

  var name: String { get }
  var category: String? { get }
  var status: String? { get }

}
