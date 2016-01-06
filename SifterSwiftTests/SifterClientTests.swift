//
//  SifterClientTests.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-06.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import XCTest
import SifterSwift

class SifterClientTests: XCTestCase {

  func testClientInit() {
    let client = SifterClient(domain: "", token: "")
    XCTAssertNotNil(client)
  }

  func testClientHasADomain() {
    let domain = "foobar"
    let client = SifterClient(domain: domain, token: "")
    XCTAssertEqual(domain, client.domain)
  }

  func testClientHasCorrectBaseURL() {
    let client = SifterClient(domain: "foobar", token: "")
    let expectedURL = NSURL(string: "https://foobar.sifterapp.com/api/")

    XCTAssertEqual(expectedURL, client.baseURL)
  }

  func testClientHasAToken() {
    let token = "abc"
    let client = SifterClient(domain: "", token: token)

    XCTAssertEqual(token, client.token)
  }

  func testClientSessionConfigurationHasTokenHeader() {
    let token = "abc"
    let client = SifterClient(domain: "", token: token)
    let config = client.sessionConfiguration

    let headers = config.HTTPAdditionalHeaders

    XCTAssertEqual(token, headers?["X-Sifter-Token"] as? String)
  }

}
