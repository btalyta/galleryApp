//
//  MockNetworking.swift
//  GalleryAppTests
//
//  Created by Barbara Souza on 14/02/21.
//

import Foundation
import NetworkingModule

@testable import GalleryApp

class MockNetworking: HttpRequestProtocol {
    var result: Decodable?
    var data: Data?

    func request<T: Decodable>(_ type: T.Type, from endpoint: Endpoint,
                               completion: ((Result<T, Error>) -> Void)?) {
        if let data = result as? T {
            completion?(.success(data))
            return
        }

        completion?(.failure(APIError.invalidData))
    }

    func request(from endpoint: Endpoint,
                 completion: ((Result<Data, Error>) -> Void)?) {
        if let resultData = data {
            completion?(.success(resultData))
            return
        }

        completion?(.failure(APIError.invalidData))
    }
}
