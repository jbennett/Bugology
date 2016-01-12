//
//  Account.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-11.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public struct Account {

//  public let name: String
  public let username: String?
  public let password: String?
  public let token: String?
  public let domain: String?
  public let serviceType: Service

  public init(username: String? = nil, password: String? = nil, token: String? = nil, domain: String? = nil, serviceType: Service) {
    self.username = username
    self.password = password
    self.token = token
    self.domain = domain
    self.serviceType = serviceType
  }

}

extension Account: Equatable {}
public func == (lhs: Account, rhs: Account) -> Bool {
  return lhs.username == rhs.username && lhs.password == rhs.password &&
    lhs.token == rhs.token && lhs.domain == rhs.domain &&
    lhs.serviceType == rhs.serviceType
}

extension Account: Hashable {
  public var hashValue: Int {
    return "\(username),\(password),\(token),\(domain),\(serviceType)".hashValue
  }
}
