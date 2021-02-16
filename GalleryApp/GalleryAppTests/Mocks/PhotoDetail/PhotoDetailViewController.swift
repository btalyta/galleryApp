//
//  PhotoDetailViewController.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 16/02/21.
//

@testable import GalleryApp

final class PhotoDetailViewControllerMock: PhotoDetailViewControllerProtocol {
    var showWasCalled = false
    var viewModel: PhotoDetailViewModel?

    func show(viewModel: PhotoDetailViewModel) {
        showWasCalled = true
        self.viewModel = viewModel
    }
}
