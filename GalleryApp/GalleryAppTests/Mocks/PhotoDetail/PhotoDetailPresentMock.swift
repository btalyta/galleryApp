//
//  PhotoDetailPresentMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 16/02/21.
//

@testable import GalleryApp

final class PhotoDetailPresentMock: PhotoDetailPresenterProtocol {
    var viewController: PhotoDetailViewControllerProtocol?
    var viewDidiLoadWasCalled = false

    func viewDidiLoad() {
        viewDidiLoadWasCalled = true
    }
}
