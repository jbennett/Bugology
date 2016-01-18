//
//  UserDefaultsAccountRepository.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-12.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import BrightFutures

let accountsStorageKey = "com.jbennett.bugology.accounts"

public class UserDefaultsAccountRepository: AccountRepository {

  var userDefaults = NSUserDefaults.standardUserDefaults()

  public init() {}

  public func getAccounts() -> Future<[Account], NoError> {
    guard let data = userDefaults.objectForKey(accountsStorageKey) as? NSData,
    let dictionary = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [NSDictionary] else {
      return future([])
    }
    let accounts = dictionary.map { Account(dictionary: $0) }

    return future(accounts)
  }

  public func saveAccount(account: Account) -> Future<Bool, NoError> {
    let userDefaults = self.userDefaults

    return getAccounts().map { oldAccounts in
      let accounts = (oldAccounts + [account]).distinct()
      let accountsDictionary = accounts.map { $0.toDictionary() }
      let data = NSKeyedArchiver.archivedDataWithRootObject(accountsDictionary)
      userDefaults.setObject(data, forKey: accountsStorageKey)

      return true
    }
  }

}

extension Account {
  public init(dictionary: NSDictionary) {
    self.username = dictionary["username"] as? String ?? nil
    self.password = dictionary["password"] as? String ?? nil
    self.token = dictionary["token"] as? String ?? nil
    self.domain = dictionary["domain"] as? String ?? nil

    let serviceType = dictionary["serviceType"] as? String ?? ""
    self.serviceType = Service(rawValue: serviceType)! // todo: Handle crash better
  }

  public func toDictionary() -> NSDictionary {
    return [
      "username": username ?? NSNull(),
      "password": password ?? NSNull(),
      "token": token ?? NSNull(),
      "domain": domain ?? NSNull(),
      "serviceType": serviceType.rawValue
    ]
  }
}
