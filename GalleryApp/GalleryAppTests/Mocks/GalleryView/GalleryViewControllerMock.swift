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
    var showWasCalled = false
    var viewModel: PhotosViewModel?
    var wantsToShowWasCalled = false
    var item: Photo?

    func showError(message: String) {
        showErrorWasCalled = true
        self.message = message
    }

    func show(viewModel: PhotosViewModel) {
        showWasCalled = true
        self.viewModel = viewModel
    }

    func wantsToShow(_ item: Photo) {
        wantsToShowWasCalled = true
        self.item = item
    }
}
