//
//  SifterLoginViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-09.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit

// todo: update token field from pasteboard

public class SifterLoginViewController: LoginViewController {

  @IBOutlet weak var domainField: UITextField!
  @IBOutlet weak var tokenField: UITextField!
  @IBOutlet weak var tokenButton: UIButton!

  public override func viewDidLoad() {
    super.viewDidLoad()
    title = "Sifter"
  }

  public override class func fromStoryboard() -> SifterLoginViewController {
    let storyboard = UIStoryboard(name: "LoginViewControllers", bundle: nil)
    guard let viewController = storyboard.instantiateViewControllerWithIdentifier("SifterLoginViewController") as? SifterLoginViewController else {
      abort()
    }

    return viewController
  }

  @IBAction private func domainDidChange() {
    if domainField.text != "" {
      tokenButton.enabled = true
    } else {
      tokenButton.enabled = false
    }
  }

  @IBAction private func didTapDomainButton() {
    guard let url = tokenURL() else { return  }

    delegate?.loginViewController(self, didRequestWebviewForURL: url)
  }

  private func tokenURL() -> NSURL? {
    guard let domain = domainField.text where domain != "" else { return nil }

    return NSURL(string: "https://\(domain).sifterapp.com/clients")
  }

  @IBAction private func didTapLogin() {
    domainField.resignFirstResponder()
    tokenField.resignFirstResponder()
//    delegate?.authRequestForSifterLoginViewController(self)
  }

}