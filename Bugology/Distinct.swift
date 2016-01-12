//
//  Unique.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-12.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

extension SequenceType where Self.Generator.Element: Hashable {

  public func distinct() -> [Generator.Element] {
    var seen: [Self.Generator.Element: Bool] = [:]
    return filter { seen.updateValue(true, forKey: $0) == nil }
  }

}
