//
//  Services.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
//import BugUIKit

public enum Service: String {
  case Bitbucket
  case Github
  case Sifter

  public static func allServices() -> [Service] {
    return [.Bitbucket, .Github, .Sifter]
  }

  public func primaryServiceColor() -> UIColor {
    switch self {
    case .Bitbucket: return UIColor.blueColor()
    case .Github: return UIColor.grayColor()
    case .Sifter: return UIColor.orangeColor()
    }
  }

  public func primaryServiceTextColor() -> UIColor {
    switch self {
    case .Bitbucket: return UIColor.whiteColor()
    case .Github: return UIColor.whiteColor()
    case .Sifter: return UIColor.whiteColor()
    }
  }

}
