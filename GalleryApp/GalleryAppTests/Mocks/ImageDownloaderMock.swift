//
//  ImageDownloaderMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import UIKit

@testable import GalleryApp

final class ImageDownloaderMock: ImageDownloaderProtocol {
    var image: UIImage?
    var getPhotoWasCalled = false

    func getPhoto(from id: String, completion: @escaping ((UIImage?) -> Void)) {
        getPhotoWasCalled = true
        completion(image)
    }
}
