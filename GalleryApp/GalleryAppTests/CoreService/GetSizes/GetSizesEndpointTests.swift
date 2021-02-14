//
//  ImageEndpointTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import XCTest

@testable import GalleryApp

class GetSizesEndpointTests: XCTestCase {
    func test_url_returnsCorrectValue() {
        let sut = createSut()
        XCTAssertEqual(sut.url, "https://api.flickr.com/services/rest/")
    }

    func test_method_returnsGET() {
        let sut = createSut()
        XCTAssertEqual(sut.method, .get)
    }

    func test_body_returnsNil() {
        let sut = createSut()

        XCTAssertNil(sut.body)
    }

    func test_header_returnsEmpty() {
        let sut = createSut()
        let expectedHeader: [String: String] = [:]

        XCTAssertEqual(sut.headers, expectedHeader)
    }

    func test_queries_returnsCorrectValues() {
        let sut = createSut()
        let expectedQueries = [
            "api_key": "123456789",
            "nojsoncallback": "1",
            "format": "json",
            "photo_id": "ABC123",
            "method": "flickr.photos.getSizes"
        ]

        XCTAssertEqual(sut.queries, expectedQueries)
    }

    func createSut() -> GetSizesEndpoint {
        return GetSizesEndpoint(apiKey: "123456789", photoId: "ABC123")
    }
}
