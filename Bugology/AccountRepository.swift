//
//  AccountRepository.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-12.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation
import BrightFutures

public protocol AccountRepository {

  func getAccounts() -> Future<[Account], NoError>
  func saveAccount(account: Account) -> Future<Bool, NoError>

}
