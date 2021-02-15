//
//  GalleryViewControllerMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation

@testable import GalleryApp

final class GalleryViewControllerMock: GalleryViewControllerProtocol {
    var showErrorWasCalled = false
    var message: String?

    func showError(message: String) {
        showErrorWasCalled = true
        self.message = message
    }
}
