//
//  NetworkClientTests.swift
//  Bugology
//
//  Created by Jonathan Bennett on 2016-01-06.
//  Copyright © 2016 Jonathan Bennett. All rights reserved.
//

import XCTest
@testable import SifterSwift

class NetworkClientTests: XCTestCase {

  func testClientHasABaseURL() {
    let baseURL = NSURL(string: "http://foobar.com")!
    let client = NetworkClient(baseURL: baseURL)

    XCTAssertEqual(baseURL, client.baseURL)
  }

  func testClientCreatesCorrectSubresourceURL() {
    let baseURL = NSURL(string: "http://abc.com")!
    let subresource = "projects"
    let expectedURL = baseURL.URLByAppendingPathComponent(subresource)
    let client = NetworkClient(baseURL: baseURL)

    XCTAssertEqual(expectedURL, client.URLForResource(subresource))
  }

  func testClientCanRetrieveData() {
    let client = NetworkClient(baseURL: NSURL(string: "https://github.com")!)
    let request = client.getResource("jbennett")
    let expectation = expectationWithDescription("Response received")

    request.onSuccess { data in
      expectation.fulfill()
    }
    request.onFailure { error in
      XCTFail("\(error)")
      expectation.fulfill()
    }

    waitForExpectationsWithTimeout(5, handler: nil)
  }

  func testClientCanRetrieveAJSONResponse() {
    let client = NetworkClient(baseURL: NSURL(string: "https://api.github.com")!)
    let request = client.getJSONResource("users/jbennett")
    let expectation = expectationWithDescription("Response received")

    request.onSuccess { _ in
      expectation.fulfill()
    }
    request.onFailure { error in
      XCTFail("\(error)")
      expectation.fulfill()
    }

    waitForExpectationsWithTimeout(5, handler: nil)
  }

}
