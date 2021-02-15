//
//  GalleryColorsTests.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import XCTest

@testable import GalleryApp

class GalleryColorsTests: XCTestCase {
    func test_loadColor_returnsCorrectColor() {
        let expectedColor = UIColor.lightGray.withAlphaComponent(0.3)
        XCTAssertEqual(expectedColor, GalleryColors.loadColor)
    }
}
