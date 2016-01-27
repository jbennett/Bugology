//
//  CommandRouter.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-26.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import Foundation

public protocol MessageHandler: class {

  var nextHandler: MessageHandler? { get }

  func handleMessage(message: Message)

}
