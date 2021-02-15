//
//  LoadingViewTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import XCTest
import SnapshotTesting

@testable import GalleryApp

class LoadingViewTests: XCTestCase {
    func test_defaultAppearance() {
        let sut = LoadingView()
        assertSnapshot(matching: sut, as: .image(size: CGSize(width: 414, height: 612)))
    }
}
