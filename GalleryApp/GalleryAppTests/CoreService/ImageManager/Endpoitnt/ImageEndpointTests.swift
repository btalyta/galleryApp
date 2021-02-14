//
//  ImageEndpointTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import XCTest

@testable import GalleryApp

class ConnectionsEndpointTests: XCTestCase {
    func test_url_returnsCorrectValue() {
        let sut = createSut()
        XCTAssertEqual(sut.url, "https://farm6.staticflickr.com/5800/31456463045_5a0af4ddc8_q.jpg")
    }

    func test_method_returnsGET() {
        let sut = createSut()
        XCTAssertEqual(sut.method, .get)
    }

    func test_body_returnsNil() {
        let sut = ImageEndpoint(url: "https://farm6.staticflickr.com/5800/31456463045_5a0af4ddc8_q.jpg")

        XCTAssertNil(sut.body)
    }

    func test_header_returnsEmpty() {
        let sut = createSut()
        let expectedHeader: [String: String] = [:]

        XCTAssertEqual(sut.headers, expectedHeader)
    }

    func test_queries_returnsEmpty() {
        let sut = createSut()
        let expectedQueries: [String: String] = [:]

        XCTAssertEqual(sut.queries, expectedQueries)
    }

    func createSut() -> ImageEndpoint {
        return ImageEndpoint(url: "https://farm6.staticflickr.com/5800/31456463045_5a0af4ddc8_q.jpg")
    }
}
