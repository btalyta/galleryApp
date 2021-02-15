//
//  ImageManagerMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 15/02/21.
//

import UIKit

@testable import GalleryApp

final class ImageManagerMock: ImageManagerProtocol {
    var image: UIImage?
    var downloadCalledCount = 0

    func download(_ key: String, imageUrl: String, completion: @escaping ((UIImage?) -> Void)) {
        downloadCalledCount += 1
        completion(image)
    }
}
