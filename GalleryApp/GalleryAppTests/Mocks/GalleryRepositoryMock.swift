//
//  GalleryRepositoryMock.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

@testable import GalleryApp

final class GalleryRepositoryMock: GalleryRepositoryProtocol {
    var tags: String?
    var page: Int?
    var result: Photos?
    var resquestPhotosCount = 0

    func resquestPhotos(tags: String, page: Int, completion: @escaping ((Result<Photos, APIError>) -> Void)) {
        self.tags = tags
        self.page = page
        resquestPhotosCount += 1
        guard let result = result else {
            completion(.failure(APIError.request))
            return
        }
        
        completion(.success(result))
    }
}
