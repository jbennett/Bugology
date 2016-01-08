//
//  AccountsViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-08.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

public class AccountsViewController: UITableViewController {

  public override func viewDidLoad() {
    super.viewDidLoad()

    title = "Accounts"
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: nil)
  }

}
