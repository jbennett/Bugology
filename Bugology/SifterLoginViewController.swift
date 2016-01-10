//
//  SifterLoginViewController.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-09.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import UIKit
import SafariServices

// todo: update token field from pasteboard

public class SifterLoginViewController: UIViewController {

  @IBOutlet weak var domainField: UITextField!
  @IBOutlet weak var tokenField: UITextField!
  @IBOutlet weak var tokenButton: UIButton!

  public weak var delegate: SifterLoginViewControllerDelegate?

  public override func viewDidLoad() {
    super.viewDidLoad()
    title = "Sifter"
    delegate = self
  }

  public static func fromStoryboard() -> SifterLoginViewController {
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

  // TODO: extract to coordinator
  @IBAction private func didTapDomainButton() {
    delegate?.didRequestTokenPageForSifterLoginViewController(self)
    
    guard let url = tokenURL() else {
      // TODO: notify
      return
    }

    let webVC = SFSafariViewController(URL: url)
    self.showViewController(webVC, sender: nil)
  }

  private func tokenURL() -> NSURL? {
    guard let domain = domainField.text where domain != "" else { return nil }

    return NSURL(string: "https://\(domain).sifterapp.com/clients")
  }

  @IBAction private func didTapLogin() {
    domainField.resignFirstResponder()
    tokenField.resignFirstResponder()
    delegate?.authRequestForSifterLoginViewController(self)
  }

}

// todo: remove after testing
extension SifterLoginViewController: SifterLoginViewControllerDelegate {
  
  public func didRequestTokenPageForSifterLoginViewController(loginViewController: SifterLoginViewController) {
    
  }
  
  public func authRequestForSifterLoginViewController(loginViewController: SifterLoginViewController) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
}

public protocol SifterLoginViewControllerDelegate: class {

  func didRequestTokenPageForSifterLoginViewController(loginViewController: SifterLoginViewController)
  func authRequestForSifterLoginViewController(loginViewController: SifterLoginViewController)

}
