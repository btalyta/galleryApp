//
//  GalleryRepositoryTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule
import XCTest

@testable import GalleryApp

class GalleryRepositoryTests: XCTestCase {
    func testFetchItem_whenRequestIsSuccessful_itShouldRetunsItems() {
        let networkMock = MockNetworking()
        networkMock.result = SearchResponseMock.value
        let sut = GalleryRepository(network: networkMock)

        sut.resquestPhotos(tags: "kitten", page: 1) { result in
            switch result {
            case .success(let data):
                XCTAssertEqual(data, SearchResponseMock.value.photos)
            default:
                XCTFail("This test was expecting a success result")
            }
        }
    }

    func testFetchItem_whenRequestFails_itShouldRetunsError() {
        let networkMock = MockNetworking()
        networkMock.result = nil
        let sut = GalleryRepository(network: networkMock)

        sut.resquestPhotos(tags: "kitten", page: 1) { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error, APIError.invalidData)
            default:
                XCTFail("This test was expecting a fail result")
            }
        }
    }
}
