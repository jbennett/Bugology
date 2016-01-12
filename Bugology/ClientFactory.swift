//
//  ServiceFactory.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-11.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public class ClientFactory {

  public func clientForAccount(account: Account) -> Client {
    switch account.serviceType {
    case .Bitbucket: return BitBucketClient()
    case .Github: return GitHubClient()
    case .Sifter: return SifterClient(account: account)
    }
  }

}
